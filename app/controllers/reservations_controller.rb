class ReservationsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  include NotaryRecordsHelper
  include ReservationsHelper

  load_and_authorize_resource

  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def handle
    ap "hello handle reservation"
    ap params
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.status = "handled"
    @reservation.save!

    unless @reservation.archive
      new_archive = Archive.create(user_id: @reservation.user_id)
      @profile = Profile.create(realname: @reservation.realname, id_no: @reservation.id_no, archive_id: new_archive.id)
      ap @profile
      notary_record = NotaryRecord.create(reservation_id: @reservation.id, notary_type: @reservation.notary_table_type, archive_id: new_archive.id, user_id: @reservation.user_id)
      ap notary_record
      #binding.pry
      @reservation.notary_table.update_attribute("notary_record_id", notary_record.id)
      @profile.save(:validate => false)

      @reservation.archive_id = new_archive.id
      @reservation.save!
      new_archive.save!
    end
    redirect_to edit_profile_url(@reservation.archive.profile)

  end

  def query
    if params.has_key?("start_date") and params.has_key?("end_date")
      gon.start_date = params["start_date"]
      gon.end_date = params["end_date"]
    else
      gon.start_date = Date.today.to_s
      gon.end_date = (Date.today + 7).to_s
    end

    ap gon.start_date
    ap gon.end_date

    start_date = Chronic.parse(gon.start_date + " 00:00:00")
    end_date = Chronic.parse(gon.end_date + " 23:59:59")

    @reservations = Reservation.where(reserve_at: start_date..end_date).order(:reserve_at)
    ap @reservations
    @results = @reservations.map do |reservation|
      [reservation.realname, reservation.notary_table_type_text, reservation.reserve_at.strftime("%Y-%m-%d %H:%M:%S"), edit_reserve_table_link_text(reservation), handle_reserve_table_link_text(reservation)]
    end

    gon.results = @results

  end

  def do_query
    if params.has_key?("daterange") and params["daterange"].length > 0
      times = params["daterange"].split(' - ')
      times[0] += " 00:00:00"
      times[1] += " 23:59:59"
      ap times[0]
      ap times[1]
      start_at = Chronic.parse(times[0])
      end_at = Chronic.parse(times[1])
      ap start_at.strftime("%H:%M:%S")
      ap end_at.strftime("%H:%M:%S")
      @reservations = Reservation.where(reserve_at: start_at..end_at).order(:reserve_at)
    else
      @reservations = Reservation.by_day.order(:reserve_at)
    end

    @results = @reservations.map do |reservation|
      #[reservation.realname, reservation.notary_table_type_text, reservation.reserve_at.strftime("%Y-%m-%d  %H:%M:%S"), '<a class="col-xs-4 register-link" href="/users/sign_up">点此注册</a>']
      #[reservation.realname, reservation.notary_table_type_text, reservation.reserve_at.strftime("%Y-%m-%d %H:%M:%S"), reserve_table_link_text(reservation)]
      [reservation.realname, reservation.notary_table_type_text, reservation.reserve_at.strftime("%Y-%m-%d %H:%M:%S"), edit_reserve_table_link_text(reservation), handle_reserve_table_link_text(reservation)]
    end

    render_success({data: @results})

  end

  # GET /reservations
  def index
    @current_day_idx = Time.now.strftime("%u").to_i
    #binding.pry
    for i in 1..5
      smart_listing_create("reservation#{i}", Reservation.where(status: "pending").by_day(offset:  (i - @current_day_idx).days).order(:reserve_at), partial: "reservations/listing")
    end
    if @current_day_idx > 5 or @current_day_idx < 1
      @current_day_idx = 1
    end
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    redirect_to reservations_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :notary_type, :reserve_at)
    end
end

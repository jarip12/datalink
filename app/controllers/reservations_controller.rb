class ReservationsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  load_and_authorize_resource

  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  def index
    @current_day_idx = Time.now.strftime("%u").to_i
    for i in 1..5
      smart_listing_create("reservation#{i}", Reservation.by_day(offset:  (i - @current_day_idx).days).order(:reserve_at), partial: "reservations/listing")
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

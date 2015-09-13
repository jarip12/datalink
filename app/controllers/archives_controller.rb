class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  autocomplete :user, :email, :full => true



  def faker_field

  end

  # GET /archives
  def index
    @archives = Archive.all
  end

  # GET /archives/1
  def show
  end

  # GET /archives/new
  def new
    @archive = Archive.new
    @profile = @archive.build_profile
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives
  def create
    @archive = Archive.new(archive_params)

    if @archive.save
      redirect_to @archive, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /archives/1
  def update
    if @archive.update(archive_params)
      redirect_to @archive,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  # DELETE /archives/1
  def destroy
    @archive.destroy
    redirect_to archives_url, notice: t('action.destroyed.successfully')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def archive_params
      params.require(:archive).permit(:realname, :id_no, :user_id, profile_attributes: [:realname, :id_no],
          loans_attributes: [:notary_type, :description, :amount, :repay_on_time],
          house_purchases_attributes: [:trade_day, :trade_type, :house_type, :house_address, :house_amount],
      )
    end
end

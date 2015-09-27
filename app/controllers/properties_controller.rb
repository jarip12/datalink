class PropertiesController < ApplicationController
  before_action :set_archive_and_related, only: [:edit]
  layout "with_left_sidebar"

  def edit

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive_and_related
      @archive = Archive.find(params[:archive_id])
      @loans = @archive.loans
      @house_purchases = @archive.house_purchases
      @deposits = @archive.deposits
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:archive).permit(:realname, :id_no, :sex, :mobile, :birth_day, :death_day, :address, :archive_id)
    end

end

class ReservationController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  load_and_authorize_resource

  def handle
    ap "handle reservation"
  end

  def index
    @reservations = smart_listing_create(:reservation, Reservation.all, partial: "reservations/listing")
  end

  def new
    @reservation = Reservation.new
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

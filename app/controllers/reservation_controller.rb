class ReservationController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    ap "i am index"
    binding.pry
    @reservations = smart_listing_create(:reservation, Reservation.all, partial: "reservations/listing")
    ap @reservations
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

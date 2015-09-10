class ReservationController < ApplicationController
  def index
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

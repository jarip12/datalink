module ReservationsHelper
  def edit_table_link(reservation)
    if reservation.notary_table_type == "foreign"
      edit_notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end

  end
end

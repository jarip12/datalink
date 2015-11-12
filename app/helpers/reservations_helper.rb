module ReservationsHelper
  def edit_table_link(reservation)
    if reservation.notary_table_type == "foreign"
      edit_notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end
  end

  def reserve_table_link_text(reservation)
    if reservation.notary_table_type == "foreign"
      link_text = notary_foreign_table_path(reservation.notary_table_id)
      return "<a class='col-xs-4 show_button' href='#{link_text}'>查看</a>"
    else
      '/'
    end
  end

  def handle_reserve_table_link_text(reservation)
    if reservation.notary_table_type == "foreign"
      link_text = reservation_handle_path(reservation)
      return "<a class='col-xs-4 show_button' href='#{link_text}'>已验证身份</a>"
    else
      '/'
    end
  end


  def reserve_table_link(reservation)
    if reservation.notary_table_type == "foreign"
      notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end
  end

end

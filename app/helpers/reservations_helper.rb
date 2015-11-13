module ReservationsHelper
  def edit_table_link(reservation)
    if reservation.notary_table_type == "foreign"
      edit_notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end
  end

  def return_back_link
    ap request.original_url
    ap url_for(:back)
    link = url_for(:back)
    ap request.original_url.split('?')
    ap link.split('?')
    link.split('?')[0] + '?' + request.original_url.split('?')[-1]
  end

  def edit_reserve_table_link_text(reservation)
    if reservation.notary_table_type == "foreign"
      link_text = edit_notary_foreign_table_path(reservation.notary_table_id)
      return "<a class='col-xs-4 show_table_button show_button' href='#{link_text}'>查看</a>"
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

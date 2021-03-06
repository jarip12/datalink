module ReservationsHelper
  def edit_table_link(reservation)
    if reservation.notary_table_type == "waimin"
      edit_notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end
  end

  def show_table_link(reservation)
    if reservation.notary_table_type == "waimin"
      notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end
  end

  def return_back_link
    ap "return_link is "
    ap session['return_link']
    if session['return_link']
      return_link = session['return_link']
      session.delete(:return_link)
      return return_link
    end
    ap request.original_url
    ap request.referer
    link = request.referer
    ap request.original_url.split('?')
    ap link.split('?')
    originals = request.original_url.split('?')
    ap originals.length
    if originals.length >= 2
      link.split('?')[0] + '?' + request.original_url.split('?')[-1]
    else
      link
    end
  end

  def reserve_table_link_text(reservation)
    if reservation.notary_table_type == "waimin"
      link_text = notary_foreign_table_path(reservation.notary_table_id)
      return "<a class='col-xs-4 show_table_button show_button' href='#{link_text}'>查看</a>"
    else
      '/'
    end
  end

  def edit_reserve_table_link_text(reservation)
    if reservation.notary_table_type == "waimin"
      link_text = edit_notary_foreign_table_path(reservation.notary_table_id)
      return "<a class='col-xs-4 show_table_button show_button' href='#{link_text}'>查看</a>"
    else
      '/'
    end
  end

  def handle_reserve_table_link_text(reservation)
    if reservation.notary_table_type == "waimin"
      link_text = reservation_handle_path(reservation)
      return "<a class='col-xs-4 show_button' href='#{link_text}'>已验证身份</a>"
    else
      '/'
    end
  end


  def reserve_table_link(reservation)
    if reservation.notary_table_type == "waimin"
      notary_foreign_table_path(reservation.notary_table_id)
    else
      '/'
    end
  end

end

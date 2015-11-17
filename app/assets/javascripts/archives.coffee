# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('dl dd a[href]').each ->
    if (this.href == window.location.href)
      $(this).addClass('current')

  $.fn.datepicker.dates['zh-CN'] = {
    days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
    daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    daysMin:  ["日", "一", "二", "三", "四", "五", "六"],
    months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
    monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
    today: "今日",
    clear: "清除",
    format: "yyyy年mm月dd日",
    titleFormat: "yyyy年mm月",
    weekStart: 1
  };


  $("#archieve_user_id").autocomplete('<%= users_path(:json) %>')
  $('body').on 'focus', ".date-input", ->
    $(".date-input").datepicker({
      language: 'zh-CN',
      format: "yyyy/mm/dd",
    });


  $('.edit-list').click ->
    $('.remove-link').show()
    $('.edit-list').hide()
    $('.edit-list-complete').show()
    $('.add_fields').hide()

  $('.edit-list-complete').click ->
    $('.remove-link').hide()
    $('.edit-list').show()
    $('.edit-list-complete').hide()
    $('.add_fields').show()

  $('body').on 'focus', "input[type=file]", ->
    $('input[type=file]').change ->


      if this.files and this.files[0]
        reader = new FileReader

        image_id = '#' + this.id + '_image'

        input_id = '#' + this.id



        reader.onload = (e) ->
          $(image_id).attr('src', e.target.result)


        reader.readAsDataURL this.files[0]

  $('#notary_related_has_crime_record_has').click ->
    $('.col-xs-6-not').show()

  $('#notary_related_has_crime_record_hasnt').click ->
    $('.col-xs-6-not').hide()

  #set image id to input file's id + image
  $('img.placeholder').each ->
    input_id = $(this).parent().parent().parent().next().find( "input" ).attr('id')
    $(this).attr('id', input_id + '_image')


  $('option.option_show').attr('selected','selected');
  $('div.select_disable').find( "select" ).attr('disabled','disabled');



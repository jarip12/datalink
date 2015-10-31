# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  console.log("hello sidebar")
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
    console.log("hello date-input")
    $(".date-input").datepicker({
      language: 'zh-CN',
      format: "yyyy/mm/dd",
    });

  console.log ("hello readurl")



  $('input[type=file]').change ->
    console.log("hello file change")
    console.log(this)
    if this.files and this.files[0]
      reader = new FileReader

      image_id = '#' + this.id + '_image'
      console.log("image_id is")
      console.log(image_id)
      reader.onload = (e) ->
        $(image_id).attr('src', e.target.result).width(86).height 81

      reader.readAsDataURL this.files[0]

  #set image id to input file's id + image
  $('img.placeholder').each ->
    console.log this
    input_id = $(this.nextElementSibling).find('input').attr('id')
    console.log(input_id)
    $(this).attr('id', input_id + '_image')



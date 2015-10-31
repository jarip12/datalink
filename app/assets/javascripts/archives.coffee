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
  $(".date-input").datepicker({
    language: 'zh-CN',
    format: "yyyy/mm/dd",
  });

  $("#archieve_user_id").autocomplete('<%= users_path(:json) %>')
  $('body').on 'focus', ".single-datepicker", ->
    console.log("hello single-datepicker")
    $(this).daterangepicker({
      singleDatePicker: true,
      showDropdowns: true,
      "locale": {
        "format": "YYYY/MM/DD",
        "separator": " - ",
        "applyLabel": "提交",
        "cancelLabel": "取消",
        "fromLabel": "从",
        "toLabel": "到",
        "customRangeLabel": "自定义",
        "daysOfWeek": [
          "周日",
          "周一",
          "周二",
          "周三",
          "周四",
          "周五",
          "周六"
        ],
        "monthNames": [
          "一月",
          "二月",
          "三月",
          "四月",
          "五月",
          "六月",
          "七月",
          "八月",
          "九月",
          "十月",
          "十一月",
          "十二月"
        ],
        "firstDay": 1
      },
    })
    ;

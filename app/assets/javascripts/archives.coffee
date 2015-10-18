# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $("#archieve_user_id").autocomplete('<%= users_path(:json) %>')
  $('body').on 'focus', ".datepicker", ->
    console.log("click datepicker")
    $('.datepicker').daterangepicker({
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
    });

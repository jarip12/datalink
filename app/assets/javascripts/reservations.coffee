# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  console.log("hello daterange")
  $('.daterange').daterangepicker({
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
    "ranges": {
      "今天": [
        moment().format("YYYY-MM-DD"),
        moment().format("YYYY-MM-DD"),
      ],
      "昨天": [
        moment().add(-1, 'day').format("YYYY-MM-DD"),
        moment().add(-1, 'day').format("YYYY-MM-DD"),
      ],
      "最近7天": [
        moment().add(-6, 'day').format("YYYY-MM-DD"),
        moment().format("YYYY-MM-DD"),
      ],
      "最近30天": [
        moment().add(-29, 'day').format("YYYY-MM-DD"),
        moment().format("YYYY-MM-DD"),
      ],
      "这个月": [
        moment().date(1).format("YYYY-MM-DD"),
        moment().format("YYYY-MM-DD"),
      ],
      "上个月": [
        moment().add(-1, 'month').date(1).format("YYYY-MM-DD"),
        moment().date(1).add(-1, 'day').format("YYYY-MM-DD"),
      ],
      "今年": [
        moment().dayOfYear(1).format("YYYY-MM-DD"),
        moment().format("YYYY-MM-DD"),
      ],
    }
  })

  $('#reservation-query-form').submit (event) ->
    console.log("hello query form")
    console.log("hello query form")
    event.preventDefault()
    form_data = {
      daterange: $('#reservation-daterange').val()
    }
    console.log(form_data)
    $.ajax
      url: $(this).attr('action')
      type: 'POST'
      dataType: 'json'
      data: form_data
      success: (json) ->
        console.log("hello")
        if json.success
          console.log(json)
          table = $("#reservation-data-table").dataTable()
          table.fnDestroy()
          console.log("table removed")
          console.log(json['data'])
          console.log(json)
          $('#reservation-data-table').DataTable( {
            data: json["data"],
            columns: [
              { title: "申请人" },
              { title: "公证类型" },
              { title: "预约时间" },
            ]
          } );
        else
          console.log(json)

  $('#reservation-data-table').DataTable( {
    data: gon.results,
    columns: [
      { title: "申请人" },
      { title: "公证类型" },
      { title: "预约时间" },
    ]
  } );


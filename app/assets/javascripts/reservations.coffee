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
      "接下来7天": [
        moment().format("YYYY-MM-DD"),
        moment().add(6, 'day').format("YYYY-MM-DD"),
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
            language: {
                "sProcessing":   "处理中...",
                "sLengthMenu":   "显示 _MENU_ 项结果",
                "sZeroRecords":  "没有匹配结果",
                "sInfo":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty":    "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix":  "",
                "sSearch":       "搜索:",
                "sUrl":          "",
                "sEmptyTable":     "无预约记录",
                "sLoadingRecords": "载入中...",
                "sInfoThousands":  ",",
                "oPaginate": {
                  "sFirst":    "首页",
                  "sPrevious": "上页",
                  "sNext":     "下页",
                  "sLast":     "末页"
                },
                "oAria": {
                  "sSortAscending":  ": 以升序排列此列",
                  "sSortDescending": ": 以降序排列此列"
                }
            },
            data: json["data"],
            order: [[ 2, 'asc' ] ],
            columns: [
              { title: "申请人" },
              { title: "公证类型" },
              { title: "预约时间" },
              { title: "查看" }
              { title: "处理预约" }
            ]
          } );
        else
          console.log(json)

  $('#reservation-data-table').DataTable( {
    language: {
      "sProcessing":   "处理中...",
      "sLengthMenu":   "显示 _MENU_ 项结果",
      "sZeroRecords":  "没有匹配结果",
      "sInfo":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
      "sInfoEmpty":    "显示第 0 至 0 项结果，共 0 项",
      "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
      "sInfoPostFix":  "",
      "sSearch":       "搜索:",
      "sUrl":          "",
      "sEmptyTable":     "无预约记录",
      "sLoadingRecords": "载入中...",
      "sInfoThousands":  ",",
      "oPaginate": {
        "sFirst":    "首页",
        "sPrevious": "上页",
        "sNext":     "下页",
        "sLast":     "末页"
      },
      "oAria": {
        "sSortAscending":  ": 以升序排列此列",
        "sSortDescending": ": 以降序排列此列"
      }
    },
    data: gon.results,
    order: [[ 2, 'asc' ] ]
    columns: [
      { title: "申请人" },
      { title: "公证类型" },
      { title: "预约时间" },
      { title: "查看" }
      { title: "处理预约" }
    ]
  } );

  $("input#profile_avatar").change ->
    console.log("change a profile avatar")
    console.log(self)
    console.log(self.files)
    if self.files && self.files[0]
      reader = new FileReader();

      reader.onload = (e) ->
        $('#blah').attr('src', e.target.result)

      reader.readAsDataURL(self.files[0]);




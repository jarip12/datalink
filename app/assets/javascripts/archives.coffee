# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $("#archieve_user_id").autocomplete('<%= users_path(:json) %>')
  console.log("hello datepicker")
  $('.datepicker').datetimepicker({
    format: "YYYY-MM-DD"
  });

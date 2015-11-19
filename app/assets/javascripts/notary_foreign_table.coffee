# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  console.log("hello my world")
  $('.type_name').on 'change', ->
    console.log("type name change")
    console.log(this.value)
    if ($.inArray(this.value, ['family_relation', 'retire', 'health', 'education', 'degree', 'grade', 'marry', 'divorce', 'driver',
                               'certificate', 'owner', 'deposit', 'qualified', 'translate']) > -1)
      $(this).parent().next().next().show()
      $(this).parent().next().show()
    else
      $(this).parent().next().next().hide()
      $(this).parent().next().hide()

  $('.type_name').each ->
    if ($.inArray(this.value, ['family_relation', 'retire', 'health', 'education', 'degree', 'grade', 'marry', 'divorce', 'driver',
                               'certificate', 'owner', 'deposit', 'qualified', 'translate']) > -1)
      $(this).parent().next().next().show()
      $(this).parent().next().show()
    else
      $(this).parent().next().next().hide()
      $(this).parent().next().hide()

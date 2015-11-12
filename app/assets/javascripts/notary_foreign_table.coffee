# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->


  $('#notary_foreign_table_notary_type').on 'change', ->
    console.log this.value
    if ($.inArray(this.value, ['family_relation', 'retire', 'health', 'education', 'degree', 'grade', 'marry', 'divorce', 'driver',
          'certificate', 'owner', 'deposit', 'qualified', 'translate']) > -1)
      $('#notary_foreign_table_notary_type_info').show()
    else
      $('#notary_foreign_table_notary_type_info').hide()

  notary_type = $('#notary_foreign_table_notary_type').val()
  if ($.inArray(notary_type, ['family_relation', 'retire', 'health', 'education', 'degree', 'grade', 'marry', 'divorce', 'driver',
    'certificate', 'owner', 'deposit', 'qualified', 'translate']) > -1)
    $('#notary_foreign_table_notary_type_info').show()


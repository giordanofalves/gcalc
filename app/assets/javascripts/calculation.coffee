$(document).ready ->
  $("input[type=number]").keyup ->
    if $(this).val() < 0 || $(this).val() > 100
      $('input[type=submit]').attr('disabled',true);
    else
      $('input[type=submit]').attr('disabled',false);
    return

  $('#new_calculation').on 'ajax:success', (event) ->
    detail = event.detail
    data = detail[0]
    status = detail[1]
    xhr = detail[2]
    $('#calculation_result').val(data.result)
    return

$(document).ready ->
  $("input[type=number]").keyup ->
    if $(this).val() < 0 || $(this).val() > 100
      $('input[type=submit]').attr('disabled',true);
    else
      $('input[type=submit]').attr('disabled',false);
    return

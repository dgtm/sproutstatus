// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $( "#tasklist" ).accordion({
      collapsible: true,
      active: false,
      autoHeight: false,
    });

    $("#pick_date").datepicker( { dateFormat: 'yy-mm-dd', minDate: 0 },{autosize: true});
});

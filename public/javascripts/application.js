// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
      $('#holiday_start_at,#leafe_start_date').datepicker({ dateFormat: 'yy-mm-dd', minDate: 0 });
      $('#holiday_end_at,#leafe_end_date').datepicker({ dateFormat: 'yy-mm-dd', minDate: 0 });
      x = $('#leafe_start_date').val();
      y = "2011/12/24";

      $('#leafe_end_date').live("click",function(){
          var x = $('#leafe_start_date').val();
          $('#leafe_end_date').val(x);
          $('#leafe_end_date').datepicker("option", "minDate",x);

      });

});

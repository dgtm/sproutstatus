// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
      $('#holiday_start_at,#leafe_start_date').datepicker({ dateFormat: 'yy-mm-dd', minDate: 0 });
      $('#holiday_end_at').datepicker({ dateFormat: 'yy-mm-dd', minDate: 0 });
      $('#leafe_end_date').datepicker({ dateFormat: 'yy-mm-dd', minDate: 0 });


      $('#leafe_end_date').live("click",function(){
          var x = $('#leafe_start_date').val();
          $('#leafe_end_date').val(x);
          $('#leafe_end_date').datepicker("option", "minDate",x);

      });

      $('#holiday_start_at').live("click",function(){
          $('#holiday_start_at').datepicker("option", "minDate",0);
      });

      $('#holiday_end_at').live("click",function(){
          var y = $('#holiday_start_at').val();
          $('#holiday_end_at').val(y);
          $('#holiday_end_at').datepicker("option", "minDate",y);

      });
       $('#jclock').tzineClock();
      $('#accordion').accordion({



        });
});

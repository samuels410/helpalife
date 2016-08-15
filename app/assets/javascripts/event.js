//
//= require jquery
//= require jquery_ujs

$(document).ready(function() {

    $('#user_is_donor').change(function() {
        if($(this).is(":checked")) {
            $("#donors-details-box").slideDown()
        }else{
            $("#donors-details-box").slideUp();
            $("#user_blood_group").removeAttr( "required" );
            $("#user_state_id").removeAttr( "required" );
            $("#user_district_id").removeAttr( "required" );
        }
    });

   if ($(location).attr('pathname') == "/event_registrations"){
       $(window).scrollTop($('#new_user').offset().top);
   }

});

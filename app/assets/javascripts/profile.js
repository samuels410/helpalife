
$(document).ready(function(){

  if ($("#target_url").length > 0){

    $('#edit_user').on('change keyup keydown', 'input, textarea, select', function (e) {
      $(this).addClass('changed-input');
    });

    function is_phone_or_blood_empty(){
      var is_empty = $("#user_phone_no").val().length == 0 || $("#user_blood_group").val().length == 0;
      return is_empty;
    }

    $(document).on('click', 'a[href]', function (event) {
        event.preventDefault();
        $("#target_url").val($(this).attr("href"));
        var msg = "";

        if(is_phone_or_blood_empty()){
          msg = "You haven't completed your registration. Please update profile page.";
          showConfirmationDialog(msg);
        }else if ($('.changed-input').length) {
          msg = "You haven\'t saved your changes.";
          showConfirmationDialog(msg);
        }else{
          location.href = $(this).attr("href");
        }
    });

    function showConfirmationDialog(msg){
      $("#myid").text(msg);
      $('#login1').modal('show');
    }

    $(document).on('click','.leave',function(event){
      location.href = $("#target_url").val();
    })

  }

});
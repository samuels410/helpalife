//    for search doners
jQuery(function() {
    var UserDistricts;
    UserDistricts = $('#user_district_id').html();
    return $('#user_state_id').change(function() {
        var escaped_state, options, state;
        state = $('#user_state_id :selected').text();
        escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(UserDistricts).filter("optgroup[label='" + escaped_state + "']").html();
        if (options) {
            $('#user_district_id').html(options);
            $('#user_district_id').show();
            return $('#district_label').show();
        } else {
            $('#user_district_id').empty();
            $('#user_district_id').hide();
            return $('#district_label').hide();
        }
    });
});


//for post need selection

jQuery(function() {
    var districts;
    districts = $('#need_district_id').html();
    return $('#need_state_id').change(function() {
        var escaped_state, options, state;
        state = $('#need_state_id :selected').text();
        escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(districts).filter("optgroup[label='" + escaped_state + "']").html();
        if (options) {
            $('#need_district_id').html(options);
            $('#need_district_id').show();
            return $('#district_label').show();
        } else {
            $('#need_district_id').empty();
            $('#need_district_id').hide();
            return $('#district_label').hide();
        }
    });
});


//bread crumps

$('.btn-group a').on('click', function(event){
    event.preventDefault();
    var input = $(this).siblings('.control-group').find('input[type=hidden]');
    if(input.length>0){
        if(input.val().toString() !== $(this).data('value').toString()){
            input.val($(this).data('value')).trigger('change');
        }
    }
});

//Need validation
$("#post_need").click(function() {
    if ($("#need_blood_group").find("option:selected" ).text() == '- Choose blood group -') {
        alert("Please select a blood group");}

    if ($("#need_state_id").find("option:selected" ).text() == '- Select state -'){
        alert("Please select state");}

    if ($("#need_district_id").find("option:selected" ).text() == '- Select district -'){
        alert("Please select district");}



});

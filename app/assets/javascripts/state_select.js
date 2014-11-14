jQuery(function() {
    var districts;
    districts = $('#user_district_id').html();
    return $('#user_state_id').change(function() {
        var escaped_state, options, state;
        state = $('#user_state_id :selected').text();
//            escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(districts).filter("optgroup[label='" + state + "']").html();
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

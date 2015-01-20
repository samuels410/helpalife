
jQuery(function() {
    var districts;
    districts = $('#user_district_id').html();
    return $('#user_state_id').change(function() {
        var escaped_state, options, state;
        state = $('#user_state_id :selected').text();
        escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(districts).filter("optgroup[label='" + escaped_state + "']").html();
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

$('.btn-group a').on('click', function(event){
    event.preventDefault();
    var input = $(this).siblings('.control-group').find('input[type=hidden]');
    if(input.length>0){
        if(input.val().toString() !== $(this).data('value').toString()){
            input.val($(this).data('value')).trigger('change');
        }
    }
});

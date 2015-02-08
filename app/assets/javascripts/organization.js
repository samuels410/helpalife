$(document).on('ready', function(){

  $('#orga_list').on("click", '.ind-org', function(e){
    var organization_id = $(this).find('#org_id').val();
    showOrganization(organization_id);

  });

  $('#other_org').on("click", '.org-tile', function(e){
    var organization_id = $(this).find('#org_id').val();
    showOrganization(organization_id);
  });

  $('#orga_form').on('change', '#orga_state_list', function(e) {
    var selected_state = $(this).val();
    if(selected_state != '') {
      populateDistrictList(selected_state);
    }

  });

});

  function populateDistrictList(state_id){

    $.ajax({
      url: '/states/get_districts',
      data: { id: state_id },
      type: 'get',
      success: function(result){
        
        if(result['key'] == 'success'){
          console.log(result);
          insertDistrictList(result['data']);
        }

      },
      failure: function(error){
        console.log(error);
      }
    });
  }

  function showOrganization(organization_id){
    $.ajax({
      url: '/organizations/display',
      data: {id: organization_id},
      type: 'get',
      success: function(data){

      },
      failure: function(error){
        console.log(error);
      }
    });
  }


  function insertDistrictList(data){

    $('#orga_dist_list').html('');

    data.forEach(function(data) {
      $('#orga_dist_list')
      .append($("<option></option>")
        .attr("value",data[1]).text(data[0]));
    });
  }
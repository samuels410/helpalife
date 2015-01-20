$(document).on('ready', function(){

  $('#orga_list').on("click", '.ind-org', function(e){
    var organization_id = $(this).find('#org_id').val();
    show_organization(organization_id);

  });

  $('#other_org').on("click", '.org-tile', function(e){
    var organization_id = $(this).find('#org_id').val();
    show_organization(organization_id);
  });

});

  function show_organization(organization_id){
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
jQuery(function($) {
	
	/* ----------------------------------------------------------- */
    /*  add ListItem
    /* ----------------------------------------------------------- */
	function addListItemHandler(event) {

  	  var addHref = $(this).attr('href');
  	  var appendTargetClassName = $(this).data('target');
  	  var appendTargetNode = $('.' + appendTargetClassName);
  	  waitingDialog.show();
  	  
  	  $.ajax({
  		  type: 'GET',
  		  url: addHref,
  		  dataType: 'html',
  		  success: function(data) {
  			appendTargetNode.append(data);
  		  },
  		  complete: function(data) {
  			  waitingDialog.hide();
  			  return false;
  		  }
  	  });
  	  
  	  return false;
    }

    $('a.addListItem').bind('click', addListItemHandler);
});
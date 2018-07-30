shinyjs.addTitle = function(str) {
  if (!$('.main-header>.navbar>.title').length) {
    // console.log('no title found, adding one');
    $('.navbar-static-top > .sidebar-toggle')
      .after('<span class="title">' + str + '</span>');
  } 
  // else { 
    // console.log('aleady has title, do nothing'); 
  // }
}

shinyjs.getActivePaneWidth = function() {
  var apWidth = $('.content-wrapper .tab-pane.active').width();
  Shiny.onInputChange('apWidth', apWidth);
}

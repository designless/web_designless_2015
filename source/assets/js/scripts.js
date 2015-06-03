//= require "ga"
//= require "jquery-1.11.1.min"
//= require "jquery.simplesidebar.min"

// sidebar
$( '.sidebar' ).simpleSidebar({
  settings: {
    opener: '#open-sb',
    animation: {
      duration: 300
    }
  },
  sidebar: {
    align: 'left',
    width: 300,
    closingLinks: 'a',
  },
});

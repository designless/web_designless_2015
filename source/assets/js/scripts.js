//= require "ga"
//= require "jquery-1.11.1.min"
//= require "jquery.simplesidebar.min"
//= require "particles.min"

// particle
particlesJS('particles-js', {
  canvas: {
    opacity: 1
  },
  particles: {
    color: '#fff',
    shape: 'cube',
    opacity: 1,
    size: 1,
    size_random: false,
    nb: 5,
    line_linked: {
      enable_auto: true,
      distance: 1500,
      color: '#fff',
      opacity: 1,
      width: 1,
      condensed_mode: {
        enable: true,
        rotateX: 65000,
        rotateY: 65000
      }
    },
    anim: {
      enable: true,
      speed: 5
    },
    array: []
  },
  interactivity: {
    enable: true,
    mouse: {
      distance: 1500
    },
    detect_on: 'canvas',
    mode: 'grab'
  },
  retina_detect: true,
  fn: {
    vendors:{
      interactivity: {}
    }
  }
});

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

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
jQuery(document).ready(function() {
  if ($(".messages-index").length > 0) {
    var pusher = new Pusher('50475f9e8a2caa59863f');
    var channel = pusher.subscribe('messages');
    channel.bind('refresh', function(data) {
      window.location.reload();
      document.getElementById('alert').play();
    });
  }
});

// Initializer

bindEvents = function() {
  $(".altai-off").altaiOff();
  $(".altai-center").altaiCenter();
};

$(document).on( "turbolinks:load", function() {
  bindEvents();
  Turbolinks.clearCache();
});

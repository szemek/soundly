require(['$api/models'], function(models) {
  models.application.addEventListener('arguments', function() {
    var arguments = api.models.application.arguments;
    $('.section').hide();
    $("#" + arguments[0]).show();
  });
});

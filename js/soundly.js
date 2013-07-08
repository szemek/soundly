require(['$api/models'], function(models) {

  $('#search').on('change', function(event) {
    var name = $(this).val();
    $.get('http://soundly.herokuapp.com/tracks/search', {name: name}, function(tracks){
      $('#tracks li').remove();

      _.each(tracks, function(track){
        var compiled = _.template("<li><%= name %></li>");
        var item = compiled({name : track.name});
        $('#tracks').append(item)
      });
    });
  });

});

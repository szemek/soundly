require(['$api/models'], function(models) {
  var search = function(query) {
    $.get('http://soundly.herokuapp.com/tracks/search', {name: query}, function(tracks){
      $('#tracks tr').remove();

      _.each(tracks, function(track){
        var compiled = _.template($('#track-item').html());
        var item = compiled({track: track});
        $('#tracks').append(item);
      });
    });
  };

  search();

  var player = models.player;
  player.load('track');

  $('#search').on('keyup', function(event) {
    var name = $(this).val();
    search(name);
  });

  $('#check').on('click', function(event) {
    try {
      player.load('track');
      var artist = _.first(player.track.artists);
      search(artist.name);
    }
    catch(e) {
      console.log(e);
      console.log('Could not fetch artist');
    }
  });
});

require(['$api/models'], function(models) {
  var player = models.player;
  player.load('track');

  $('#search').on('keyup', function(event) {
    var name = $(this).val();
    $.get('http://soundly.herokuapp.com/tracks/search', {name: name}, function(tracks){
      $('#tracks tr').remove();

      _.each(tracks, function(track){
        var compiled = _.template($('#track-item').html());
        var item = compiled({track: track});
        $('#tracks').append(item)
      });
    });
  });

  $('#check-artist').on('click', function(event) {
    try {
      player.load('track');
      var artist = _.first(player.track.artists);

      $.get('http://soundly.herokuapp.com/tracks/search', {name: artist.name}, function(tracks){
        $('#tracks tr').remove();

        _.each(tracks, function(track){
          var compiled = _.template($('#track-item').html());
          var item = compiled({track: track});
          $('#tracks').append(item)
        });
      });
    }
    catch(e) {
      console.log(e);
      console.log('Could not fetch artist');
    }
  });

  $('#update-tracks').on('click', function(event) {
    console.log('Updating...');
    $.post('http://soundly.herokuapp.com/tracks/update', {pages: 1});
  })

});

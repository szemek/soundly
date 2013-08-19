require(['$api/models'], function(models) {
  function update_info(track) {
    if(track){
      var artistName = track.artists[0].name;
      $('#artist').text(artistName);

      var trackName = track.name;
      $('#title').text(trackName);

      $.get('http://soundly.herokuapp.com/lyrics', {artist: artistName, title: trackName}, function(data){
        $('#lyrics').html(data);
      });
    }
  }

  var player = models.player;
  player.load('track');
  var track = player.track;

  player.addEventListener('change', function() {
    player.load('track');
    track = player.track;
    update_info(track);
  });

  $('button#update').on('click', function() {
    player.load('track');
    track = player.track;
    update_info(track);
  });

  update_info(track);
});

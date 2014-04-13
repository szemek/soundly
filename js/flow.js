require(['$api/models'], function(models) {
  var player = models.player;
  player.addEventListener('change:track', function(event) {
    player.load('track');

    var track = player.track;
    if(track.advertisement) {
      player.seek(track.duration - 1);
      player.play();
    }
  });
});


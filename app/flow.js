require(['$api/models'], function(models) {
  var player = models.player;

  var skip = function (){
    player.load('track').done(function(){
      var track = player.track;

      if(track && track.advertisement) {
        player.seek(player.duration - 1);
        player.play();
      }
    });
  };

  setInterval(skip, 1000);
});


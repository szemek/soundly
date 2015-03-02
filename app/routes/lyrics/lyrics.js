angular.module('soundly.routes.lyrics', []);

angular.module('soundly.routes.lyrics').controller('LyricsController', ['$scope', function($scope){
    require(['$api/models'], function(models) {
    var player = models.player;
    function update_lyrics() {
      player.load('track');
      var track = player.track;

      if(track){
        var artistName = track.artists[0].name;
        $('#artist').text(artistName);

        var trackName = track.name;
        $('#title').text(trackName);

        var ignoredArtists = ["Spotify"];

        if(_.contains(ignoredArtists, artistName)) {
          return;
        }

        $.get('http://soundly.herokuapp.com/lyrics', {artist: artistName, title: trackName}, function(data){
          $('#text').html(data);
        });
      }
    }
    // listeners
    models.application.addEventListener('arguments', function() {
      var arguments = models.application.arguments;
      if(arguments[0] == 'lyrix') {
        update_lyrics();
      }
    });
    player.addEventListener('change', update_lyrics);

    update_lyrics();
  });
}]);

angular.module('soundly.routes.playlist', []);

angular.module('soundly.routes.playlist').controller('PlaylistController', ['$scope', function($scope){
  $scope.tracks = [];

  $scope.updatePlaylist = function(player, models){
    $scope.tracks = [];

    player.load('context').done(function(){
      if(player.context !== null){
        var playlist = new models.Playlist(player.context.uri);

        playlist.load('tracks').done(function(){
          playlist.tracks.snapshot().done(function(snapshot){
            _.each(_.range(snapshot.length), function(i){
              var track = snapshot.get(i);
              $scope.tracks.push({name: track.name, artist: track.artists[0].name});
              _.defer(function(){$scope.$apply();});
            });
          });
        });
      }
    });
  };

  require(['$api/models'], function(models) {
    var player = models.player;

    player.addEventListener('change:track', function() {
      $scope.updatePlaylist(player, models);
    });

    $scope.updatePlaylist(player, models);
  });
}]);

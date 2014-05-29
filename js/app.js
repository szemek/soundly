var app = angular.module('soundly', []);

app.controller('PlaylistController', ['$scope', function($scope){
  $scope.tracks = [];

  $scope.updatePlaylist = function(player, models){
    $scope.tracks = [];

    player.load('context').done(function(){
      var playlist = new models.Playlist(player.context.uri);

      playlist.load('tracks').done(function(){
        playlist.tracks.snapshot().done(function(snapshot){
          _.each(_.range(snapshot.length), function(i){
            $scope.tracks.push(snapshot.get(i));
            $scope.$apply();
          });
        });
      });
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

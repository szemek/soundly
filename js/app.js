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
            var track = snapshot.get(i);
            $scope.tracks.push({name: track.name, artist: track.artists[0].name});
            _.defer(function(){$scope.$apply();});
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

app.controller('ScrobblesController', ['$scope', '$http', function($scope, $http){
  var soundly_search_url = 'http://soundly.herokuapp.com/tracks/search';
  $http.defaults.headers.common['Accept'] = 'application/json';

  $scope.scrobbles = [];

  $scope.fetchScrobbles = function(options){
    var params = options || {};
    $http.get(soundly_search_url, {params: params}).success(function(data){
      $scope.scrobbles = data.search;
      _.defer(function(){$scope.$apply();});
    });
  };

  $scope.search = _.debounce(function(){
    $scope.fetchScrobbles({name: $scope.query});
  }, 500);

  $scope.fetchScrobbles();
}]);

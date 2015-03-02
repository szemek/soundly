app.controller('ScrobblesController', ['$scope', '$http', function($scope, $http){
  var soundly_search_url = 'http://soundly.herokuapp.com/api/tracks/search';

  $scope.scrobbles = [];

  $scope.fetchScrobbles = function(options){
    var options = options || {};
    $http.post(soundly_search_url, options).success(function(tracks) {
      $scope.scrobbles = tracks;
    });
  };

  $scope.search = _.debounce(function(){
    $scope.fetchScrobbles({name: $scope.query});
  }, 500);

  $scope.fetchScrobbles();
}]);

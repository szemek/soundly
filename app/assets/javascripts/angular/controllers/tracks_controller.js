app.controller('TracksController', ['$scope', function ($scope) {
  $.getJSON('/api/tracks', function(tracks){
    $scope.tracks = tracks;
    $scope.$apply();
  });

  var fetch = function($scope) {
    $.post('/api/tracks/search', {name: $scope.name}, function(tracks){
      $scope.tracks = tracks;
      $scope.$apply();
    });
  };

  $scope.search = _.debounce(function(){
    fetch($scope);
  }, 300);
}]);

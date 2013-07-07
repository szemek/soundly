angular.module('project', ['ngResource'])
.factory('Track', ['$resource', function($resource) {
  return $resource('/tracks');
}]);

var TracksCtrl = ['$scope', 'Track', function ($scope, Track) {
  var fetch = function($scope) {
    $.getJSON('/tracks/search', {name: $scope.name}, function(data){
      $scope.tracks = data;
      $scope.$apply(); // force refresh
    });
  };

  $scope.tracks = Track.query();
  $scope.search = _.debounce(function(){
    fetch($scope);
  }, 300);
}];

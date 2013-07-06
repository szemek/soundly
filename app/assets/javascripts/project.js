angular.module('project', ['ngResource'])
.factory('Track', ['$resource', function($resource) {
  return $resource('/tracks');
}]);

var TracksCtrl = ['$scope', 'Track', function ($scope, Track) {
  $scope.tracks = Track.query();
  $scope.search = function() {
    $.getJSON('/tracks/search', {name: $scope.name}, function(data){
      $scope.tracks = data;
    });
  };
}];

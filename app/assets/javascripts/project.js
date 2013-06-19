angular.module('project', ['ngResource'])
.factory('Track', ['$resource', function($resource) {
  return $resource('/tracks');
}]);

var TracksCtrl = ['$scope', 'Track', function ($scope, Track) {
  $scope.tracks = Track.query();
}];

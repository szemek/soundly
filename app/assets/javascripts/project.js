angular.module('project', ['ngResource'])
.factory('Track', function($resource) {
  var Track = $resource('/tracks');
  return Track;
});


function TracksCtrl($scope, Track) {
  $scope.tracks = Track.query();
}

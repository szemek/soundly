var app = angular.module('project', ['ngResource']);

app.controller('TracksController', ['$scope', function ($scope) {
  $.getJSON('/tracks.json', function(data){
    $scope.tracks = data.tracks;
    $scope.$apply();
  });

  var fetch = function($scope) {
    $.getJSON('/tracks/search', {name: $scope.name}, function(data){
      $scope.tracks = data;
      $scope.$apply(); // force refresh
    });
  };

  $scope.search = _.debounce(function(){
    fetch($scope);
  }, 300);
}]);

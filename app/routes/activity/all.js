angular.module('soundly').controller('AllActivityController', ['$scope', '$http', '$sce', function($scope, $http, $sce){
  var activity_svg_url = 'http://soundly.herokuapp.com/activity/all.svg';

  $http.get(activity_svg_url).success(function(data){
    $scope.svg = $sce.trustAsHtml(data);
  });
}])

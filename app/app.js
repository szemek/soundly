angular.module('soundly', [
  'ui.router',
  'soundly.routes.activity',
  'soundly.routes.lyrics',
  'soundly.routes.playlist',
  'soundly.routes.scrobbles'
])
.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('/scrobbles');

  $stateProvider
    .state('scrobbles', {
      url: '/scrobbles',
      templateUrl: '/app/routes/scrobbles/scrobbles.html'
    })
    .state('lyrics', {
      url: '/lyrics',
      templateUrl: '/app/routes/lyrics/lyrics.html'
    })
    .state('playlist', {
      url: '/playlist',
      templateUrl: '/app/routes/playlist/playlist.html'
    })
    .state('activity', {
      url: '/activity',
      templateUrl: '/app/routes/activity/activity.html'
    })
}])
.controller('DashboardController', ['$scope', '$state', function($scope, $state){
  $scope.state = $state;
}]);

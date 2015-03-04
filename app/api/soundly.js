angular.module('soundly.api.soundly', [])
.service('SoundlyApi', function($http) {
  var api = this;

  var baseUrl = 'http://soundly.herokuapp.com';

  var routes = {
    allActivityUrl: function() { return baseUrl + '/activity/all.svg'; },
    recentActivityUrl: function() { return baseUrl + '/activity/recent.json'; }
  };

  api.allActivity = function() {
    return $http.get(routes.allActivityUrl());
  };

  api.recentActivity = function() {
    return $http.get(routes.recentActivityUrl());
  };
});

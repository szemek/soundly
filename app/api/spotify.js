angular.module('soundly.api.spotify', [])
.service('SpotifyApi', function($q){
  _.extend(this, new SpotifyWebApi());
  this.setPromiseImplementation($q);
});

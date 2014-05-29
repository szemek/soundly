window.api = {};
require(['$api/activity'], function(activity) { window.api.activity = activity; });
require(["$api/audio"], function(audio) { window.api.audio = audio; });
require(["$api/core"], function(core) { window.api.core = core; });
require(["$api/devtools"], function(devtools) { window.api.devtools = devtools; });
require(["$api/facebook"], function(facebook) { window.api.facebook = facebook; });
require(["$api/i18n"], function(i18n) { window.api.i18n = i18n; });
require(["$api/library"], function(library) { window.api.library = library; });
require(["$api/location"], function(location) { window.api.location = location; });
require(["$api/messaging"], function(messaging) { window.api.messaging = messaging; });
require(["$api/models"], function(models) {
  window.api.models = models;
  window.player = models.player;
});
require(["$api/offline"], function(offline) { window.api.offline = offline; });
require(["$api/relations"], function(relations) { window.api.relations = relations; });
require(["$api/runtime"], function(runtime) { window.api.runtime = runtime; });
require(["$api/search"], function(search) { window.api.search = search; });
require(["$api/toplists"], function(toplists) { window.api.toplists = toplists; });

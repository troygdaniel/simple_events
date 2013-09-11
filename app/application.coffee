window.App = {
  Models:{},
  Collections:{},
  Views:{},
}
App.Events = _.extend({}, Backbone.Events)

restful_sync = Backbone.sync

Backbone.sync = (method, model, options) ->
  error = (response) ->
    console.log "GLOBAL error"
  success = (response) ->
    console.log "GLOBAL success"
  restful_sync(method, model, options)
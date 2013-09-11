class App.Views.VisitDetailView extends Backbone.View
  tagName: 'li'
  className: 'visit-view'

  events:
    "click": "updateEditPane"

  initialize: ->
    @template = Handlebars.compile $('#tmpl-visit').html()
    @model.on 'change', @render, @
    @$el.attr 'data-cid', @model.cid

  updateEditPane: (e) ->
    App.Events.trigger 'visit:selected', @model
    $(".visit-view").css({"background-color":"#ffffff"})
    @$el.css({"background-color":"#6F93DB"})

  render: ->
    @$el.html @template(@model.toJSON())

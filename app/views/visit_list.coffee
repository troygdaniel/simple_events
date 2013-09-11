class App.Views.VisitListView extends Backbone.View
  el: '#visit_list'

  render: ->
    _.each @collection.models, (visit) =>
      visit_view = new App.Views.VisitDetailView(model: visit)
      visit_view.render()
      @$el.append visit_view.el
    @

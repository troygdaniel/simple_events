class App.Views.SchedulePage extends Backbone.View
  el: '#content'

  initialize: (options) ->
    # VisitListView
    @visits = new App.Collections.VisitList(options['restaurants'])
    @visitListView = new App.Views.VisitListView(collection: @visits)
    
    # CalendarView
    @calendarView = new App.Views.CalendarView(collection: new App.Collections.VisitList())
    
    # VisitEditPane
    @visitEditPane = new App.Views.VisitEditPane()

  render: ->
    @visitListView.render()
    @calendarView.render()
    @visitEditPane.render()
    @

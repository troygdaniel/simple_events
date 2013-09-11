class App.Views.CalendarView extends Backbone.View
  el: '#visit_calendar'

  initialize: ->
    @collection.on 'add', @handleEventAdded, @

  handleEventAdded: (model) ->
    @$el.fullCalendar 'addEventSource', [model.toCalendar()]

  render: ->
    options =
      that: @
      defaultView: 'agendaWeek'
      allDaySlot: false
      contentHeight: 500      
      minTime: 7
      maxTime: 24
      events: @collection.toCalendar()

    @$el.fullCalendar options
    @

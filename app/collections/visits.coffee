class App.Collections.VisitList extends Backbone.Collection
  model: App.Models.Visit

  initialize: ->
    App.Events.on 'visit:confirmed', @handleVisitConfirmed, @

  handleVisitConfirmed: (savedModel) ->
    if !@contains savedModel
      console.log('Confirmed: added')
      @add savedModel

  comparator: (visit) ->
    visit.get('date').toDate()

  toCalendar: ->
    events = []
    _.each @models, (visit) ->
      events.push visit.toCalendar()
    events

class App.Models.Visit extends Backbone.Model
  url: ->
    "/scheduled_calls/#{@get('id')}.json"

  initialize: ->
    @setExtendedAttributes()

  setExtendedAttributes: ->
    @set date: moment(@get('date'))
    @set humanDate: moment(@get('date')).format("MMM D YYYY");
    @set relativeDate: @get('date').calendar()
    @set mStartTime: moment(@get('start_time'))
    @set mEndTime: moment(@get('end_time'))
    @set startTime: moment(@get('start_time')).format('h:mm a')
    @set endTime: moment(@get('end_time')).format('h:mm a')
    @set duration: moment.duration(@get('duration'), 'minutes').humanize()

  # GG: I'm trying to mimic the Rails #update_attributes here, except this
  # one doesn't persist the changes to the data store.
  updateAttributes: (new_attrs) ->
    _.each new_attrs, (value, key) =>
      @set key, value

  isScheduled: ->
    @get("scheduled") == true

  toCalendar: ->
    id: @cid,
    title: @get('location').name,
    start: @get('mStartTime').unix().toString(),
    end: @get('mEndTime').unix().toString(),
    allDay: false

  startTimeAsHours: ->
    moment(@get("start_time")).hours()

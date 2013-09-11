class App.Views.VisitEditPane extends Backbone.View
  el: '#visit_edit'
  events:
    'click .save': 'saveVisit'
    'click .cancel': 'cancelChanges'

  initialize: ->
    @template = Handlebars.compile $('#tmpl-visit-edit-pane').html()
    @model = null #start empty
    App.Events.on 'visit:selected', @handleVisitSelected, @

  cancelChanges: (e) ->
    e.preventDefault()
    @hideMyself()

  saveVisit: (e) ->
    e.preventDefault()
    @hideMyself()
    new_time = @$('select').val()
    new_date = moment(@$('.date').val()).add('h', parseInt(new_time))
    @model.set 'start_time', new_date.toString()
    # @model.save @model.toJSON(),
    #   success: (model, response, options) =>
    #     console.log "success"

    @model.setExtendedAttributes()
    App.Events.trigger 'visit:confirmed', @model

  handleVisitSelected: (model) ->
    @showMyself()
    @model = model
    @render()

  render: ->
    if @model
      @$el.html @template(@model.toJSON())
      @$('#visit-edit-datepicker input').datepicker({dateFormat: 'M d, yy'})
      @$('#time_drop_down').val(@model.startTimeAsHours())
    @

  hideMyself: ->
    console.log "hideMyself"
    $("#overlay").hide()
    @$el.hide()
    @
  
  showMyself: ->
    $("#overlay").show()
    @$el.show()

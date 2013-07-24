$ ->

  class window.Event extends Backbone.Model


  class window.Events extends Backbone.Collection


  class window.EventsView extends Backbone.View
    el: $('#page')

    initialize: ->
      @template =  """
        <div id="calendar"></div>
        """
      @render()

    events: ->
      'click #back' : 'goToMenu'

    render: =>
      $('#container').html(@template)
      $('#menu').html('Calendar')
      $('#back').html('Menu')
      
    goToMenu: () ->
      App.navigate('/menu', trigger: true)
      $('#back').empty()

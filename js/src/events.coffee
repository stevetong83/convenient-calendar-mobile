$ ->

  class window.Event extends Backbone.Model


  class window.Events extends Backbone.Collection

  class window.EventsView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template =  """
        <div id="calendar"></div>
        """
      @render()

    events: ->
      "click #back" : "loadMenu"

    render: =>
      $(@el).html(@template)
      $('#menu').html('Calendar')

    loadMenu: () ->
      console.log 'clicked'
      App.navigate('/menu', trigger: true)
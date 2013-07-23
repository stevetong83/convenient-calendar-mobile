$ ->

  class window.EventsView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template =  """
        <div id="calendar">Calendar</div>
        """
      @render()

    render: =>
      $(@el).html(@template)
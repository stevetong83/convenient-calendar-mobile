$ ->

  class window.Event extends Backbone.Model


  class window.Events extends Backbone.Collection




  class window.EventsView extends Backbone.View
    el: $('#page')

    initialize: ->
      @template =  """
        <div id="calendar"></div>
        <div id="footer">
        <div class="fc-button fc-state-default fc-corner-left" id="month">Month</div>
        <div id="week">Week</div>
        <button id="day">Day</button>
        </div>
        """
      @render()

    events: ->
      'click #back' : 'goToMenu'

    render: =>
      $('#container').html(@template)
      
      $('#back').html('Menu')
      $('#calendar').fullCalendar({
        viewDisplay: (view) ->
          jQuery('#menu').html(view.title)
        header: {
          left: 'prev',
          right: 'next'
        },

        aspectRatio: 1,
        defaultView: 'month',
        slotMinutes: 30,
        eventSource: ""
        })
      
      $('#month').click ->
        $('#calendar').fullCalendar( 'changeView', 'month' )
      $('#week').click ->
        $('#calendar').fullCalendar( 'changeView', 'basicWeek' )
      $('#day').click ->
        $('#calendar').fullCalendar( 'changeView', 'basicDay' )
      

    goToMenu: () ->
      App.navigate('/menu', trigger: true)

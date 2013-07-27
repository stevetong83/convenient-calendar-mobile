$ ->

  class window.Event extends Backbone.Model


  class window.Events extends Backbone.Collection




  class window.EventsView extends Backbone.View
    el: $('#page')

    initialize: ->
      @template =  """
        <div id="cal-header">
          <div id="today">
            <span class="today fc-button fc-state-default fc-corner-left fc-corner-right">Today</span>
          </div>
          <div id="new-event">
            <span class="new-event fc-button fc-state-default fc-corner-left fc-corner-right">+</span>
          </div>
        </div>
        <div id="calendar"></div>
        <div id="cal-footer">
          <div id="previous"><span class="previous fc-button fc-state-default fc-corner-left fc-corner-right"><</span></div>
          <div id="center">
            <div class="month fc-button fc-state-default fc-corner-left">Month</div>
            <div class="week fc-button fc-state-default">Week</div>
            <div class="day fc-button fc-state-default fc-corner-right">Day</div>
          </div>
          <div id="next"><span <span class="next fc-button fc-state-default fc-corner-left fc-corner-right">></span></div>
        </div>
        """
      @render()

    events: ->
      'tap .month'      :   'changeToMonthView'
      'tap .week'       :   'changeToWeekView'
      'tap .day'        :   'changeToDayView'
      'tap .today'      :   'today'
      'tap .previous'   :   'previous'
      'tap .next'       :   'next'

    render: =>
      $('#container').html(@template)
      $('#back').html('Menu')
      $('#calendar').fullCalendar({
        viewDisplay: (view) ->
          $('#menu').html(view.title)
        header: false,

        aspectRatio: 1,
        defaultView: 'month',
        slotMinutes: 30,
        eventSource: ""
      })
      $(window).on "swipeleft", (event) ->
        $('#calendar').fullCalendar('next')
      $(window).on "swiperight", (event) ->
        $('#calendar').fullCalendar('prev')

    changeToMonthView: () ->
      $('#calendar').fullCalendar( 'changeView', 'month' )

    changeToDayView: () ->
      $('#calendar').fullCalendar( 'changeView', 'basicDay' )

    changeToWeekView: () ->
      $('#calendar').fullCalendar( 'changeView', 'basicWeek' )

    today: () ->
      $('#calendar').fullCalendar('today')

    previous: () ->
      $('#calendar').fullCalendar('prev')

    next: () ->
      $('#calendar').fullCalendar('next')

      


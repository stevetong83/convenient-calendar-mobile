$ ->

  class window.Event extends Backbone.Model


  class window.Events extends Backbone.Collection




  class window.EventsView extends Backbone.View
    el: $('#page')

    initialize: ->
      @template =  """
        <div id="cal-header">
          <div id="today">
            <button class="cal-button today">Today</button>
          </div>
          <div id="new-event">
            <button class="new-event cal-button">+</button>
          </div>
        </div>
        <div id="calendar"></div>
        <div id="cal-footer">
          <div id="previous">
            <button class="previous cal-button"><</button>
          </div>
          <div id="center">
            <button class="month cal-button">Month</button>
            <button class="week cal-button">Week</button>
            <button class="day cal-button">Day</button>
          </div>
          <div id="next">
            <button class="next cal-button">></button>
          </div>
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
      $('#back').html("<button class='icon'>Menu</button")
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

      $(".today, .new-event, .previous, .next, .month, .week, .day").bind "touchstart", ->
        $(this).addClass('active')
      $(".today, .new-event, .previous, .next, .month, .week, .day").bind "touchend", ->
        $(this).removeClass('active')

      $(".icon").bind "touchstart", ->
        $('.icon').addClass('active')
      $(".icon").bind "touchend", ->
        $('.icon').removeClass('active')

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

      


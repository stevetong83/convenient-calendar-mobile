$ ->

  class window.Event extends Backbone.Model


  class window.Events extends Backbone.Collection




  class window.EventsView extends Backbone.View
    el: $('#page')

    initialize: ->
      @template =  """
        <div id="modal">
          <div id="modal-header">
            <div class="wrapper">
              <div id="modal-menu">
                New Event
              </div>
              <div id="modal-back">
                <button class='icon'>Cancel</button>
              </div>
              <div id="form">
                <form>
                  <input type="text" name="event" placeholder="Event" />
                  <input type="text" name="location" placeholder="Location"/>
                  <input type="date" id="start-date" placeholder="Start Date" />
                  <input type="time" id="start-time" placeholder="Start Time" pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$" />
                  All Day: <input type="checkbox" />
                  <textarea name="description" placeholder="Description" rows="5"/>
                  <button class='cal-button wide-button'>Add Event</button>
                </form>
              </div>
            </div>
          </div>
        </div>
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
      'tap .new-event'          :   'addNewEvent'
      'tap #modal-back > .icon'               :   'cancel'
      'tap .month'              :   'changeToMonthView'
      'tap .week'               :   'changeToWeekView'
      'tap .day'                :   'changeToDayView'
      'tap .today'              :   'today'
      'tap .previous'           :   'previous'
      'tap .next'               :   'next'
      'tap #start_date'         :    'openStartDate'
      

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
        eventSource: "",
        loading: (bool) ->
          if (bool) 
            $('#loading').show()
          else 
            $('#loading').hide()
        dayClick: (date, allDay, jsEvent, view) ->
          alert date
      })

      $(window).on "swipeleft", (event) ->
        $('#calendar').fullCalendar('next')
      $(window).on "swiperight", (event) ->
        $('#calendar').fullCalendar('prev')

      $(".cal-button").bind "touchstart", ->
        $(this).addClass('active')
      $(".cal-button").bind "touchend", ->
        $(this).removeClass('active')

      $(".icon").bind "touchstart", ->
        $('.icon').addClass('active')
      $(".icon").bind "touchend", ->
        $('.icon').removeClass('active')

    addNewEvent: () ->
      $('#modal').show()
      $('#cal-footer').hide()

    cancel: (e) ->
      e.preventDefault()
      $('#modal').hide()
      $('#cal-footer').show()

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

    openStartDate: () ->


      
      


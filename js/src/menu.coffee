$ ->
    class window.MenuView extends Backbone.View
      el: ('#page')

      initialize: ->
        @template = """
          <ul id="nav">
            <li id="events"><img src="" />Calendar</li>
            <li id="contacts"><img src="" />Contacts</li>
            <li id="photos"><img src="" />Photos</li>
          </ul>
          """
        @render()


      events: ->
        "tap #events"   : "loadEvents"
        "tap #contacts" : "loadContacts"
        "tap #photos"   : "loadPhotos"
        'tap #back' : 'goToMenu'

      render: =>
        $('#container').html(@template)
        $('#menu').html('Menu')
        $('#back').html('')

        $("#nav li").bind "touchstart", ->
          $(this).addClass('active')
        $("#nav li").bind "touchend", ->
          $(this).removeClass('active')


      loadEvents: () ->
        App.navigate('/events', trigger: true)

      loadContacts: () ->
        App.navigate('/contacts', trigger: true)

      loadPhotos: () ->
        App.navigate('/photos', trigger: true)

      goToMenu: () ->
        App.navigate('/menu', trigger: true)
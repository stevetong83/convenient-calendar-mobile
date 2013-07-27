$ ->
    class window.MenuView extends Backbone.View
      el: ('#page')

      initialize: ->
        @template = """
          <ul id="nav">
            <li id="events">Calendar</li>
            <li id="contacts"><div >Contacts</div></li>
            <li id="photos">Photos</li>
          </ul>
          """
        @render()

      events: ->
        "click #events"   : "loadEvents"
        "click #contacts" : "loadContacts"
        "click #photos"   : "loadPhotos"
        'click #back' : 'goToMenu'

      render: =>
        $('#container').html(@template)
        $('#menu').html('')
        $.mobile.loadingMessage = false

      loadEvents: () ->
        App.navigate('/events', trigger: true)

      loadContacts: () ->
        App.navigate('/contacts', trigger: true)

      loadPhotos: () ->
        App.navigate('/photos', trigger: true)

      goToMenu: () ->
        App.navigate('/menu', trigger: true)
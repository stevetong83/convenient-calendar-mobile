$ ->
    class window.MenuView extends Backbone.View
      el: ('#container')

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

      render: =>
        $(@el).html(@template)
        $('#menu').html('Menu')

      loadEvents: () ->
        App.navigate('/events', trigger: true)

      loadContacts: () ->
        App.navigate('/contacts', trigger: true)

      loadPhotos: () ->
        App.navigate('/photos', trigger: true)
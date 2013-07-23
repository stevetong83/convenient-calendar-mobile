$ ->
    class window.MenuView extends Backbone.View
      el: ('#container')

      initialize: ->
        @template = """
          <div id="events">Calendar</div>
          <div id="contacts">Contacts</div>
          <div id="photos">Photos</div>
          """
        @render()

      events: ->
        "click #events" : "loadEvents"
        "click #contacts" : "loadContacts"
        "click #photos" : "loadPhotos"

      render: =>
        $(@el).html(@template)

      loadEvents: () ->
        App.navigate('/events', trigger: true)

      loadContacts: () ->
        App.navigate('/contacts', trigger: true)

      loadPhotos: () ->
        App.navigate('/photos', trigger: true)
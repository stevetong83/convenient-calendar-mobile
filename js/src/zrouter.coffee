$ ->
  
  class window.BackboneAppRouter extends Backbone.Router
    routes:
      ""          : "index"
      "menu"      : "menu"
      "events"    : "events"
      "contacts"  : "contacts"
      "photos"    : "photos"

    index: ->
      window.sessionView = new SessionView

    menu: ->
      window.menuView = new MenuView

    events: ->
      window.eventsView = new EventsView

    contacts: ->
      window.contactsView = new ContactsView

    photos: ->
      window.photosView = new PhotosView

    window.App = new BackboneAppRouter()
    Backbone.history.start()
$ ->

  class window.Contact extends Backbone.Model

    

  class window.Contacts extends Backbone.Collection



  class window.ContactsView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template =  """
        <div id="contacts">Contacts</div>
        """
      @render()

    render: =>
      $(@el).html(@template)
      $('#menu').html('Contacts')
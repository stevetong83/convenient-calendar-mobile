$ ->

  class window.ContactsView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template =  """
        <div id="contacts">Contacts</div>
        """
      @render()

    render: =>
      $(@el).html(@template)
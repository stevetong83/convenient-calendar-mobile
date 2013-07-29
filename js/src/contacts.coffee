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
      $(".icon").bind "touchstart", ->
          $('.icon').addClass('active')
      $(".icon").bind "touchend", ->
        $('.icon').removeClass('active')

    render: =>
      $(@el).html(@template)
      $('#menu').html('Contacts')
      $('#back').html("<button class='icon'>Menu</button")

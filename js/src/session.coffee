$ ->

  class window.SessionView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template = """
        <button id="login">Sign In</button>
        """
      @render()

    events: ->
      "click #login" : "loadMenu"

    render: =>
      $(@el).html(@template)

    loadMenu: () ->
      App.navigate('/menu', trigger: true)

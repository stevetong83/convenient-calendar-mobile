$ ->

  class window.Session extends Backbone.Model

    

  class window.SessionView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template = """
        <p><input type="text" name="email" placeholder="Email" /></p>
        <p><input type="text" name="password" placeholder="Password" /></p>
        <p><button id="login">Sign In</button></p>
        """
      @render()

    events: ->
      "click #login" : "loadMenu"

    render: =>
      $(@el).html(@template)
      

    loadMenu: () ->
      App.navigate('/menu', trigger: true)

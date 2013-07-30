$ ->

  class window.Session extends Backbone.Model

    

  class window.SessionView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template = """
        <div id="sessions">
        <img src="images/logo.jpg"/>
        <h1>Welcome to Convenient Calendar</h1>
        <p><input type="text" name="email" placeholder="Email" /></p>
        <p><input type="text" name="password" placeholder="Password" /></p>
        <p><button id="login" class="cal-button wide-button">Sign In</button></p>
        </div>
        """
      @render()

      $("#login").bind "touchstart", ->
        $('#login').addClass('active')
      $("#login").bind "touchend", ->
        $('#login').removeClass('active')

    events: ->
      "click #login" : "loadMenu"

    render: =>
      $(@el).html(@template)
      $('#header').hide()
      
      

    loadMenu: () ->
      App.navigate('/menu', trigger: true)
      $('#header').show()

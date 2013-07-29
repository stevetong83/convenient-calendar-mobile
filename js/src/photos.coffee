$ ->

  class window.Photo extends Backbone.Model




  class window.Photos extends Backbone.Collection




  class window.PhotosView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template =  """
        <div id="photos">Photos</div>
        """
      @render()
      $(".icon").bind "touchstart", ->
          $('.icon').addClass('active')
      $(".icon").bind "touchend", ->
        $('.icon').removeClass('active')

    render: =>
      $(@el).html(@template)
      $('#menu').html('Photos')
      $('#back').html("<button class='icon'>Menu</button")
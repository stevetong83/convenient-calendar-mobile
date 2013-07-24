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

    render: =>
      $(@el).html(@template)
      $('#menu').html('Photos')
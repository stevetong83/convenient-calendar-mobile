$ ->

  class window.PhotosView extends Backbone.View
    el: $('#container')

    initialize: ->
      @template =  """
        <div id="photos">Photos</div>
        """
      @render()

    render: =>
      $(@el).html(@template)
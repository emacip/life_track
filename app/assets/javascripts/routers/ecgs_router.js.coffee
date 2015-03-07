app.routers.Ecgs = Backbone.Router.extend
  initialize : ->
    @ecgs = new app.collections.Ecgs window.ecgs
    @indexView = new app.views.ecgs.Index
      collection : @ecgs

    @showView = new app.views.ecgs.Show
      model : @ecgs.at 0

    $('body').append @indexView.render()
    $('body').append @showView.render()

  routes :
    "ecgs/" : "index"
    "ecgs/:id" : "show"

  index : () ->
    $('.action-view').hide()
    @indexView.$el.show()

  show : (id) ->
    $('.action-view').hide()
    model = @ecgs.get id
    @showView.model = model
    @showView.render()
    @showView.$el.show()
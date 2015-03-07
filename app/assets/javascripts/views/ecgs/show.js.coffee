app.views.ecgs ?= {}

app.views.ecgs.Show = Backbone.View.extend
  id : 'show-view'

  className : 'action-view'

  template : JST['templates/ecgs/show']

  serialize : ->
    @model.toJSON() if @model

  render : ->
    @$el.html @template(@serialize()) if @model
    @$el
app.views.ecgs ?= {}

app.views.ecgs.Index = Backbone.View.extend
  id : 'index-view'

  className : 'action-view'

  template : JST['templates/ecgs/index']

  
  initialize : ->
    @collection.on 'reset', @.render, @
    @collection.on 'change add remove', @.render, @

  serialize : ->
    ecgs : @collection

  render : ->
    @$el.html @template(@serialize())
    @$el
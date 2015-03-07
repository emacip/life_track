app.collections.Ecgs = Backbone.Collection.extend
  model : app.models.Ecg
  url : '/ecgs'

  initialize : () ->
    app.on 'ecgs', @handle_change, @

  handle_change : (message) ->

    switch message.action
      when 'create'
        @add message.obj

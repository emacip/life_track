app.views.ecgs ?= {}

app.views.ecgs.Form = Backbone.View.extend
  id : 'form-view'

  className : 'action-view'

  template : JST['templates/ecgs/form']

  events :
    'click input[type=submit]' : 'save'

  initialize : ->
    @model = new app.models.Ecg()

  save : (evt) ->
    evt.preventDefault()
    @isNew = @model.isNew()
    @model.save @formValues(),
        success : () =>
          if @isNew
            app.collections.ecgs.add @model

          @clear()
          app.navigate '/ecgs/', true
        error :(error) =>
          console.log error

  clear : () ->
    @model = new app.models.Ecg()
    this.$el.find('input[type=number],input[type=number]').val('')

  serialize : ->
    @model.toJSON()

  formValues : ->
      value : this.$el.find('input[name=value]').val()
      user_id : this.$el.find('input[name=user_id]').val()

  render : ->
    @$el.html @template(@serialize())
    @$el
app.models.Ecg = Backbone.Model.extend
  urlRoot : '/ecgs'
  defaults :
    value : 0
    user_id : 0
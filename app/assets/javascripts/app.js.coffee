$ () ->
  start = () ->
    app.realtime.connect();
    ecgsRouter = new app.routers.Ecgs();
    Backbone.history.start({pushState: true});

  start();
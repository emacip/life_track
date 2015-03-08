window.app.realtime =
  connect : () ->
    window.app.socket = io.connect('http://0.0.0.0:1234');

    window.app.socket.on 'rt_ecg', (message) ->
      window.app.trigger 'ecgs', message
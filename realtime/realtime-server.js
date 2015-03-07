var io = require('socket.io').listen(1234),
    redis = require('redis').createClient();

redis.subscribe('rt_ecg');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.send( message);
  });
});


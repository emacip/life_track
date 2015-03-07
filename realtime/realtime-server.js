var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('rt_ecg');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.emit('rt_ecg', JSON.parse(message));
  });
});


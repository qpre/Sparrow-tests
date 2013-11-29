var socket;

function createWebSocket(host) {
  
    socket = new WebSocket(host);
    
    socket.onopen = function() {
      console.log('Socket opened')
    }
    
    socket.onclose = function() {
      console.log('Socket closed')
    }

    socket.onmessage = function(msg) {
      try {
        data = JSON.parse(msg.data);
      } catch(exception) {
        data = msg.data
      }      
      console.log(data);
    }
}

function sendMessage(message) {
  socket.send(message);
}

createWebSocket("ws://127.0.0.1:6262");
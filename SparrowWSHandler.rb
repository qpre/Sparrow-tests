require 'em-websocket'
require_relative 'SparrowAudioStreamer'

class SparrowWSHandler
  
  attr_accessor :ws, :streamer

  def initialize ws
    @ws = ws
    @ws.onopen do |handshake|
      @handshake = handshake
      onOpen
    end
    
    @ws.onclose do
      onClose
    end
    
    @ws.onmessage do |msg|
      onMessage msg
    end
  end
  
  def onOpen
    puts 'client connected'
    @streamer = SparrowAudioStreamer.new
  end
  
  def onMessage msg
    puts "client sent #{msg}"
    @streamer.play
  end
  
  def onClose
    puts 'client closed'
  end
  
  def send msg
    @ws.send msg
  end
end

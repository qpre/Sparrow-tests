require_relative 'SparrowWSHandler'

class SparrowServer
  
  # Constructor :
  #
  #   Initialises SparrowServer
  #
  def initialize
  end

  # start :
  #
  #   creates a EventMachine instance
  #
  def start
    puts 'launching server'
    EM::run do
      EM::WebSocket.run(:host => "0.0.0.0", :port => 6262) do |ws|
        sigHandler
        SparrowWSHandler.new ws
      end
    end
  end
  
  # stop :
  #
  #   closes the client (it any connection was up)
  #
  def stop
    EM.stop
  end
  
  # sigHandler
  #
  #   handles signals received
  #
  def sigHandler
    Signal.trap("INT")  { stop }
    Signal.trap("TERM") { stop }
  end
  
  # Destructor :
  # 
  #   What about cleaning our mess ?
  #
  def finalize
    puts 'byebye'
    stop
  end
end

SparrowServer.new.start
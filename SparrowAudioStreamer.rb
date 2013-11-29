require 'hallon'
require 'hallon-openal'

class SparrowAudioStreamer
  attr_accessor :session, :cur_track

  def initialize
    puts 'connecting through spotify'
    @session = Hallon::Session.initialize(IO.read('credentials/spotify_appkey.key'))
    @session.login!('username', 'password')
  end
  
  def play
    @cur_track = Hallon::Track.new("spotify:track:1ZPsdTkzhDeHjA5c2Rnt2I")
    @cur_track.load

    @player = Hallon::Player.new(Hallon::OpenAL)
    @player.play!(@cur_track)
  end
end
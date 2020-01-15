require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods 

  @@artists = []

  def initialize
    super
    @songs = []
  end

  # we have defined the find_by_name method in the Findable module, so we can extend it and use it in this class 
  # def self.find_by_name(name)
  #   @@artists.detect{|a| a.name == name}
  # end

  def self.all
    @@artists
  end

  # by extending the Memorable module, we have access to the two below methods, 
  # so we do not need to write these out again 
  # def self.reset_all
  #   self.all.clear
  # end

  # def self.count
  #   self.all.count
  # end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # defined in Paramble 
  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end

end

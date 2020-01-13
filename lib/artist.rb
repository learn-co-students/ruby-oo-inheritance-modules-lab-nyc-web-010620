require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

  @@all = []

  # def initialize
  #   self.class.all << self
  # end

  # def self.find_by_name(name)
  #   @@all.detect{|a| a.name == name}
  # end

  def self.all
    @@all
  end

  # def self.reset_all
  #   self.all.clear
  # end

  # def self.count
  #   self.all.count
  # end

  def songs 
    Song.all.select do |song|
      song.artist == self
    end 
  end 

  def add_song(song)
    self.class.all << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end

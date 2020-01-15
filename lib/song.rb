require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods 

  @@songs = []

  # def initialize
  #   @@songs << self
  # end

  # we have defined the find_by_name method in the Findable module, so we can extend it and use it in this class 
  # def self.find_by_name(name)
  #   @@songs.detect{|a| a.name == name}
  # end

  def self.all
    @@songs
  end

  # by extending the Memorable module, we have access to the two below methods, 
  # so we do not need to write these out again 
  # def self.reset_all
  #   self.all.clear
  # end

  # def self.count
  #   self.all.count
  # end

  def artist=(artist)
    @artist = artist
  end

  # defined in Paramble module 
  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end

end

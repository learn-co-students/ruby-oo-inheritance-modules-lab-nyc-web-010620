require 'pry'
require_relative "./common_functionality.rb"

class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  attr_accessor :name, :artist

  @@songs = []

  def initialize
    @@songs << self
  end

  def self.find_by_name(name)
    @@songs.detect{|a| a.name == name}
  end

  def self.all
    @@songs
  end
end

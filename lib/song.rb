require 'pry'

class Song
  
  attr_accessor :name, :artist_name

  @@all = []

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_name)
    new_song = Song.new
    song_split = song_name.split('.')[0].split(' - ')
    new_song.artist_name = song_split[0]
    new_song.name = song_split[1]
    new_song
  end

  def self.create_from_filename(song_name)
    song = self.new_from_filename(song_name)
    song.save
  end

end

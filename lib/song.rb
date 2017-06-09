require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create

    song = Song.new
    song.save
    return song

  end

  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def Song.find_by_name(name)
    return @@all.detect do |song|
      song.name == name
    end
  end

  def Song.find_or_create_by_name(name)

    detected_song = @@all.detect do |song|
      song.name == name
    end
    if detected_song == nil
      return Song.create_by_name(name)
    else
      return detected_song
    end
  end

  def Song.alphabetical

    return @@all.sort_by do |song|
      song.name
    end

  end

  def Song.new_from_filename(file_name)

    song_info = file_name.split(" - ")
    song_info[1] = song_info[1].split(".")
    song_info.flatten!
    song = Song.new_by_name(song_info[1])
    song.artist_name = song_info[0]
    return song

  end

  def Song.create_from_filename(file_name)

    song_info = file_name.split(" - ")
    song_info[1] = song_info[1].split(".")
    song_info.flatten!
    song = Song.create_by_name(song_info[1])
    song.artist_name = song_info[0]
    return song

  end

  def Song.destroy_all

    @@all.clear

  end

end

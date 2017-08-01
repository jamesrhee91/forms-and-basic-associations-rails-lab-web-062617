class Song < ActiveRecord::Base
  # attr_reader :artist_name

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(contents)
     contents.each do |content|
       next if content.blank?
       note = Note.find_or_create_by(content: content)
       self.notes << note
     end
   end

   def note_contents
     self.notes.map(&:content)
   end

   def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end

   def genre_name
     self.genre.name
   end

end

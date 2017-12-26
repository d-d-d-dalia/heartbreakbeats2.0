class User < ApplicationRecord

	has_many :songs, dependent: :destroy
  
  has_secure_password

  REGEX_VALID_EMAIL = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :email, :username, :password, presence: true
  validates :email, uniqueness: {case_sensitive: false}
 	validates :email, format: {with: REGEX_VALID_EMAIL}
  validates :password, length: {minimum: 6}

  def self.find_or_create_by_omniauth(auth_hash)
    @user = where(email: auth_hash[:info][:email]).first_or_create do |user|
      user.username = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
      # creates random base 16 password
      user.password = SecureRandom.hex
    end
  end

  # def next_song (song_id)
  #   # song = songs.find(song_id)
  #   # binding.pry
  #   # if song.id == songs.last.id
  #   #   # song = songs.first
  #   # end

  # end

  def next_song (song_id)
    nextSong = songs.find do |song|
      song.id > song_id.to_i
    end
    nextSong ? nextSong : songs.first
  end

end
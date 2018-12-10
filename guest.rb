class Guest

  attr_reader :guest_name, :guest_favourite_song, :guest_money

  def initialize(guest_name, guest_favourite_song, guest_money)
    @guest_name = guest_name
    @guest_favourite_song = guest_favourite_song
    @guest_money = guest_money
  end

  def guest_talk
    return "Whoo!"
  end

end

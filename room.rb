class Room

  attr_reader :room_name, :room_size, :room_guest_array, :room_playlist_array, :room_price

  def initialize(room_name, room_size, room_guest_array, room_playlist_array, room_price)
    @room_name = room_name
    @room_size = room_size
    @room_guest_array = room_guest_array
    @room_playlist_array = room_playlist_array
    @room_price = room_price
  end


end

class Room

  attr_reader :room_name, :room_size, :room_guest_array, :room_playlist_array, :room_price

  def initialize(room_name, room_size, room_guest_array, room_playlist_array, room_price)
    @room_name = room_name
    @room_size = room_size
    @room_guest_array = room_guest_array
    @room_playlist_array = room_playlist_array
    @room_price = room_price
  end

  def guest_count
    return @room_guest_array.length
  end

  def add_guest_to_room(guest)
    @room_guest_array.push(guest)
  end

  def remove_guest_from_room(guest)
    @room_guest_array.delete(guest)
  end


end

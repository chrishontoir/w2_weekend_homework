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

  def playlist_count
    return @room_playlist_array.length
  end

  def add_song_to_playlist(song)
    @room_playlist_array.push(song)
  end

  def check_available_space
    if guest_count < @room_size
      return true
    else
      return false
    end
  end

  def add_guest_to_room_if_space_available(availability, guest)
    if availability == true
      add_guest_to_room(guest)
    else
      return "Sorry there is no space left in this room."
    end
  end

  def check_guest_has_enough_money(guest)
    if guest.guest_money >= @room_price
      return true
    else
      return false
    end
  end

  def add_guest_to_room_if_enough_money_and_space(availability, enough_money, guest)
    # if availability == true && enough_money == true
    #   add_guest_to_room(guest)
    # else
    #   return "Sorry, there's no room or you don't have enough money."
    # end
    if availability == true
      if enough_money == true
        add_guest_to_room(guest)
      else
        return "Sorry, you don't have enough money."
      end
    else
      return "Sorry, there's no space available."
    end
  end

end

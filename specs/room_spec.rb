require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Blue Room", 30, [], [], 5)
    @guest1 = Guest.new("Chris", "Step into Christmas", 100)
    @guest2 = Guest.new("Bob", "Merry Christmas Everyone", 50)
    @guest3 = Guest.new("Sally", "Last Christmas", 1500)
    @song1 = Song.new("Jingle Bells", "3:30")
  end

  def test_room_name
    assert_equal("Blue Room", @room.room_name)
  end

  def test_room_size
    assert_equal(30, @room.room_size)
  end

  def test_room_guest_array
    assert_equal([], @room.room_guest_array)
  end

  def test_room_playlist_array
    assert_equal([], @room.room_playlist_array)
  end

  def test_room_price
    assert_equal(5, @room.room_price)
  end

  def test_guest_count
    assert_equal(0, @room.guest_count)
  end

  def test_add_guest_to_room
    @room.add_guest_to_room(@guest1)
    assert_equal(1, @room.guest_count)
  end

  def test_remove_guest_from_room
    @room.add_guest_to_room(@guest2)
    @room.add_guest_to_room(@guest3)
    @room.remove_guest_from_room(@guest2)
    assert_equal(1, @room.guest_count)
  end

  def test_playlist_count
    assert_equal(0, @room.playlist_count)
  end

  def test_add_song_to_playlist
    @room.add_song_to_playlist(@song1)
    assert_equal(1, @room.playlist_count)
  end

  def test_check_available_space__true
    room2 = Room.new("Green Room", 1, [], [], 5)
    assert_equal(true, room2.check_available_space)
  end

  def test_check_available_space__false
    room2 = Room.new("Green Room", 0, [], [], 5)
    assert_equal(false, room2.check_available_space)
  end

  def test_check_guest_into_room__space_available
    room3 = Room.new("Yellow Room", 1, [], [], 10)
    availability = room3.check_available_space

    room3.add_guest_to_room_if_space_available(availability, @guest1)
    assert_equal(1, room3.guest_count)
  end

  def test_check_guest_into_room__space_unavailable
    room3 = Room.new("Yellow Room", 0, [], [], 10)
    availability = room3.check_available_space

    room3.add_guest_to_room_if_space_available(availability, @guest1)
    assert_equal(0, room3.guest_count)
    assert_equal("Sorry there is no space left in this room.", room3.add_guest_to_room_if_space_available(availability, @guest1))
  end

  def test_guest_has_enough_money__true
    room4 = Room.new("Red Room", 10, [], [], 5)
    assert_equal(true, room4.check_guest_has_enough_money(@guest1))
  end

  def test_guest_has_enough_money__false
    room4 = Room.new("Red Room", 10, [], [], 101)
    assert_equal(false, room4.check_guest_has_enough_money(@guest1))
  end

  def test_add_guest_to_room_if_enough_money_and_space
    room5 = Room.new("Purple Room", 2, [], [], 10)
    availability = room5.check_available_space
    enough_money = room5.check_guest_has_enough_money(@guest1)

    room5.add_guest_to_room_if_enough_money_and_space(availability, enough_money, @guest1)
    assert_equal(1, room5.guest_count)
  end

  def test_add_guest_to_room_if_enough_money_and_space__no_money
    room5 = Room.new("Purple Room", 2, [], [], 101)
    availability = room5.check_available_space
    enough_money = room5.check_guest_has_enough_money(@guest1)

    room5.add_guest_to_room_if_enough_money_and_space(availability, enough_money, @guest1)
    assert_equal(0, room5.guest_count)
    assert_equal("Sorry, you don't have enough money.", room5.add_guest_to_room_if_enough_money_and_space(availability, enough_money, @guest1))
  end

  def test_add_guest_to_room_if_enough_money_and_space__no_space
    room5 = Room.new("Purple Room", 0, [], [], 10)
    availability = room5.check_available_space
    enough_money = room5.check_guest_has_enough_money(@guest1)

    room5.add_guest_to_room_if_enough_money_and_space(availability, enough_money, @guest1)
    assert_equal(0, room5.guest_count)
    assert_equal("Sorry, there's no space available.", room5.add_guest_to_room_if_enough_money_and_space(availability, enough_money, @guest1))
  end
end

require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Blue Room", 30, [], [], 5)
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
    guest1 = Guest.new("Chris", "Step into Christmas", 100)
    @room.add_guest_to_room(guest1)
    assert_equal(1, @room.guest_count)
  end

  def test_remove_guest_from_room
    guest1 = Guest.new("Bob", "Merry Christmas Everyone", 50)
    guest2 = Guest.new("Sally", "Last Christmas", 1500)
    @room.add_guest_to_room(guest1)
    @room.add_guest_to_room(guest2)
    @room.remove_guest_from_room(guest1)
    assert_equal(1, @room.guest_count)
  end
end

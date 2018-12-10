require('minitest/autorun')
require('minitest/rg')
require_relative('../room')

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
end

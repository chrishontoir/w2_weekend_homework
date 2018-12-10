require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Jennifer", "Time in a Bottle", 20)
  end

  def test_guest_name
    assert_equal("Jennifer", @guest.guest_name)
  end

  def test_guest_favourite_song
    assert_equal("Time in a Bottle", @guest.guest_favourite_song)
  end

  def test_guest_money
    assert_equal(20, @guest.guest_money)
  end

  def test_guest_talk
    assert_equal("Whoo!", @guest.guest_talk)
  end
end

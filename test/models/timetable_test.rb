require 'test_helper'

class TimetableTest < ActiveSupport::TestCase

  def test_timetable_stored
    tt = Timetable.create(:subject => "Math", :day_of_week => 1, :slot_time => 1)
    assert_equal(tt.subject, "Math")
    assert_equal(tt.day_of_week, 1)
    assert_equal(tt.slot_time, 1)
  end

end
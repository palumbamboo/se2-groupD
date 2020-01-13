require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase

  def test_formatted_date
    att = Attendance.new(:date => Date.today)
    assert_equal(Date.today.strftime("%Y-%m-%d"), att.formatted_date)
  end

  def test_formatted_enters_at
    time = Time.now
    att = Attendance.new(:enters_at => time)
    assert_equal(time.strftime("%H:%M:%S"), att.formatted_enters_at)
  end

  def test_formatted_exits_at
    time = Time.now
    att = Attendance.new(:exits_at => time)
    assert_equal(time.strftime("%H:%M:%S"), att.formatted_exits_at)
  end

end
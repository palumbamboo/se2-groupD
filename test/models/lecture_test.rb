require 'test_helper'

class LectureTest < ActiveSupport::TestCase

  def test_date
    lecture = Lecture.new(:name => "Lecture", :start_time => Time.now, :duration => 1)
    assert_equal(true, lecture.start_time.class == Time)
  end

  def test_to_s
    lecture = Lecture.new(:name => "Lecture", :start_time => Time.now, :duration => 1)
    assert_equal("Lecture", lecture.name)
  end

  def test_end_time
    lecture = Lecture.new(:name => "Lecture", :start_time => Time.now, :duration => 1)
    assert_equal(lecture.start_time + lecture.duration.hours, lecture.end_time)
  end
end
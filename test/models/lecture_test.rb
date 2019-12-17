require 'test_helper'

class LectureTest < ActiveSupport::TestCase

  def test_date
    lecture = Lecture.new(:name => "Lecture", :start_time => Time.now, :end_time => Time.now + 1.hour)
    assert_equal(true, lecture.start_time.class == Time)
  end

  def test_to_s
    lecture = Lecture.new(:name => "Lecture", :start_time => Time.now, :end_time => Time.now + 1.hour)
    assert_equal("Lecture", lecture.name)
  end
end
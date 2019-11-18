require 'test_helper'

class SchoolClassTest < ActiveSupport::TestCase
  def test_the_truth
    assert true
  end

  def test_class_to_s1
    school_class = SchoolClass.new(:number => 3, :section => 'b')
    assert_equal("3B", school_class.class_to_s)
  end
end
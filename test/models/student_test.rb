require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def test_the_truth
    assert true
  end

  def test_to_s1
    student = Student.new(:name => "giulia", :surname => "milan")
    assert_equal("Giulia Milan", student.to_s)
  end

  def test_birth_date1
    student = Student.new(:name => "giulia", :surname => "milan", :birth_date => "05/09/1996")
    assert_equal(true, student.birth_date.class == Date)
  end

  def test_enrollment_date1
    student = Student.new(:name => "giulia", :surname => "milan", :birth_date => "05/09/1996", :enrollment_date => "15/09/2019")
    assert_equal(true, student.enrollment_date.class == Date)
  end
end
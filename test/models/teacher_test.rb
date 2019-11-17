require 'test_helper'
 
class TeacherTest < ActiveSupport::TestCase
    def test_the_truth
        assert true
    end 

    def test_to_s1
        teacher = Teacher.new(:name => "paolo", :surname => "garza")
        assert_equal("Paolo Garza", teacher.to_s)
    end
end
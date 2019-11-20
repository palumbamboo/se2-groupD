require 'test_helper'
 
class StudentsControllerTest < ActionDispatch::IntegrationTest
    # potrei testare quando non sono autenticata

    #test "test should get index" do
        # questo non worka perche non ho fatto il login, come faccio a dirgli di loggare?
    #    get students_url
    #    assert_response :success
    #end

    test "test should redirect to students_url" do
        assert_difference('Student.count') do
            post students_url, params: { student: { :name => "Giulia", :surname => "Milan", :fiscal_code => "AAA"}}
        end
        assert_redirected_to students_url(Student.last)
    end
end
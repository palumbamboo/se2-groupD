require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase
    def test_to_s
        admin = Administrator.new(:name => "prova", :surname => "admin")
        assert_equal("Prova Admin", admin.to_s)
    end
end
require 'test_helper'

class MaterialTest < ActiveSupport::TestCase

    def test_material_stored
        m = Material.new(:title => "Material", :description => "Description", :subject => "Math")
        assert_equal(m.title, "Material")
        assert_equal(m.subject, "Math")
        assert_equal(m.description, "Description")
    end
end
module ControllerMacros
    def login_admin
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:admin]
            sign_in FactoryBot.create(:admin)
        end
    end

    def login_user(passed_user)
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            sign_in passed_user
        end
    end
end
require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(name: "example User", email: "user@example.com",
                        password: "foobar", password_confirmation: "foobar",
                        )
    end
    
    test "should be valid" do
        assert @user.valid?
    end

    test "name should be present" do
        @user.name = ""
        assert_not @user.valid?
    end

    test "email should be present" do
        @user.email = ""
        assert_not @user.valid?
    end

    test "password should be present" do
        @user.password=@user.password_confirmation=""
        assert_not @user.valid?
    end
    # test "the truth" do
    #   assert true
    # end
end

require 'test_helper'

class AdministratorControllerTest < ActionController::TestCase
  test "should get create,new,edit" do
    get :create,new,edit
    assert_response :success
  end

end

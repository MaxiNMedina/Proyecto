require 'test_helper'

class ContactoControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contacto_contact_url
    assert_response :success
  end

end

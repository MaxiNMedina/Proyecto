require 'test_helper'

class PreguntasfrecuentesControllerTest < ActionDispatch::IntegrationTest
  test "should get faq" do
    get preguntasfrecuentes_faq_url
    assert_response :success
  end

end

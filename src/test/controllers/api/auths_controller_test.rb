require "test_helper"

class Api::AuthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_auth = api_auths(:one)
  end

  test "should get index" do
    get api_auths_url, as: :json
    assert_response :success
  end

  test "should create api_auth" do
    assert_difference('Api::Auth.count') do
      post api_auths_url, params: { api_auth: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_auth" do
    get api_auth_url(@api_auth), as: :json
    assert_response :success
  end

  test "should update api_auth" do
    patch api_auth_url(@api_auth), params: { api_auth: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_auth" do
    assert_difference('Api::Auth.count', -1) do
      delete api_auth_url(@api_auth), as: :json
    end

    assert_response 204
  end
end

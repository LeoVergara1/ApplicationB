require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping = shippings(:one)
  end

  test "should get index" do
    get shippings_url, as: :json
    assert_response :success
  end

  test "should create shipping" do
    assert_difference('Shipping.count') do
      post shippings_url, params: { shipping: { delivery: @shipping.delivery, name: @shipping.name, status: @shipping.status } }, as: :json
    end

    assert_response 201
  end

  test "should show shipping" do
    get shipping_url(@shipping), as: :json
    assert_response :success
  end

  test "should update shipping" do
    patch shipping_url(@shipping), params: { shipping: { delivery: @shipping.delivery, name: @shipping.name, status: @shipping.status } }, as: :json
    assert_response 200
  end

  test "should destroy shipping" do
    assert_difference('Shipping.count', -1) do
      delete shipping_url(@shipping), as: :json
    end

    assert_response 204
  end
end

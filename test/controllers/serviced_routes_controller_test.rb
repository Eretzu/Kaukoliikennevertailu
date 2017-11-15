require 'test_helper'

class ServicedRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serviced_route = serviced_routes(:one)
  end

  test "should get index" do
    get serviced_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_serviced_route_url
    assert_response :success
  end

  test "should create serviced_route" do
    assert_difference('ServicedRoute.count') do
      post serviced_routes_url, params: { serviced_route: { route_id: @serviced_route.route_id, service_provider_id: @serviced_route.service_provider_id } }
    end

    assert_redirected_to serviced_route_url(ServicedRoute.last)
  end

  test "should show serviced_route" do
    get serviced_route_url(@serviced_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_serviced_route_url(@serviced_route)
    assert_response :success
  end

  test "should update serviced_route" do
    patch serviced_route_url(@serviced_route), params: { serviced_route: { route_id: @serviced_route.route_id, service_provider_id: @serviced_route.service_provider_id } }
    assert_redirected_to serviced_route_url(@serviced_route)
  end

  test "should destroy serviced_route" do
    assert_difference('ServicedRoute.count', -1) do
      delete serviced_route_url(@serviced_route)
    end

    assert_redirected_to serviced_routes_url
  end
end

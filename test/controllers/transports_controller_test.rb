require 'test_helper'

class TransportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transport = transports(:one)
  end

  test "should get index" do
    get transports_url
    assert_response :success
  end

  test "should get new" do
    get new_transport_url
    assert_response :success
  end

  test "should create transport" do
    assert_difference('Transport.count') do
      post transports_url, params: { transport: { arrival_time: @transport.arrival_time, bus_id: @transport.bus_id, departure_time: @transport.departure_time, end_date: @transport.end_date, from_id: @transport.from_id, recurrence: @transport.recurrence, start_date: @transport.start_date, to_id: @transport.to_id } }
    end

    assert_redirected_to transport_url(Transport.last)
  end

  test "should show transport" do
    get transport_url(@transport)
    assert_response :success
  end

  test "should get edit" do
    get edit_transport_url(@transport)
    assert_response :success
  end

  test "should update transport" do
    patch transport_url(@transport), params: { transport: { arrival_time: @transport.arrival_time, bus_id: @transport.bus_id, departure_time: @transport.departure_time, end_date: @transport.end_date, from_id: @transport.from_id, recurrence: @transport.recurrence, start_date: @transport.start_date, to_id: @transport.to_id } }
    assert_redirected_to transport_url(@transport)
  end

  test "should destroy transport" do
    assert_difference('Transport.count', -1) do
      delete transport_url(@transport)
    end

    assert_redirected_to transports_url
  end
end

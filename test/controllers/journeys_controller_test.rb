require 'test_helper'

class JourneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journey = journeys(:one)
  end

  test "should get index" do
    get journeys_url
    assert_response :success
  end

  test "should get new" do
    get new_journey_url
    assert_response :success
  end

  test "should create journey" do
    assert_difference('Journey.count') do
      post journeys_url, params: { journey: { arrival_time: @journey.arrival_time, bus_id: @journey.bus_id, departure_time: @journey.departure_time, from_id: @journey.from_id, journey_date: @journey.journey_date, to_id: @journey.to_id } }
    end

    assert_redirected_to journey_url(Journey.last)
  end

  test "should show journey" do
    get journey_url(@journey)
    assert_response :success
  end

  test "should get edit" do
    get edit_journey_url(@journey)
    assert_response :success
  end

  test "should update journey" do
    patch journey_url(@journey), params: { journey: { arrival_time: @journey.arrival_time, bus_id: @journey.bus_id, departure_time: @journey.departure_time, from_id: @journey.from_id, journey_date: @journey.journey_date, to_id: @journey.to_id } }
    assert_redirected_to journey_url(@journey)
  end

  test "should destroy journey" do
    assert_difference('Journey.count', -1) do
      delete journey_url(@journey)
    end

    assert_redirected_to journeys_url
  end
end

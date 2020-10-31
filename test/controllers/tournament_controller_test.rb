require 'test_helper'

class TournamentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tournament_index_url
    assert_response :success
  end

end

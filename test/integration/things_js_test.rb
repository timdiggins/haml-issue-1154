require "test_helper"

class ThingsJsTest < ActionDispatch::IntegrationTest
  setup do
    @thing = things(:one)
  end

  test "visiting as js" do
    get thing_url(@thing, format: :js), xhr: true
    File.write("tmp/screenshots/things_js_test.js", response.body)
    assert_response :success
    assert_includes(response.body, "application.js.erb")
    # should be using application.js.erb
  end
end

require "application_system_test_case"

class ThingsTest < ApplicationSystemTestCase
  setup do
    @thing = things(:one)
  end

  test "visiting as html" do
    visit thing_url(@thing)
    take_screenshot
    # should be using application.html.haml
    assert_text "Some navigation stuff goes here"
    # should be using show.html.haml
    assert_no_selector "table.show-raw-table"
    assert_selector "a[href='#{things_path}']"
    assert_selector "a[href='#{edit_thing_path(@thing)}']"
    assert_selector "a[href='#{thing_path(@thing, format: :raw)}']"
    # should be using _thing.html.haml
    assert_no_selector "tr.thing"
    assert_text "Name:"
  end

  test "visiting as raw" do
    visit thing_path(@thing, format: :raw)
    take_screenshot
    # should be using application.haml
    assert_no_text "Some navigation stuff goes here"
    # should be using show.haml
    assert_selector "table.show-raw-table"
    assert_no_selector "a[href='#{things_path}']"
    assert_no_selector "a[href='#{edit_thing_path(@thing)}']"
    assert_no_selector "a[href='#{thing_path(@thing, format: :raw)}']"
    # should be using _thing.haml
    assert_selector "tr.thing"
    assert_no_text "Name:"
  end

  # test "visiting the index" do
  #   visit things_url
  #   assert_selector "h1", text: "Things"
  # end
  #
  # test "should create thing" do
  #   visit things_url
  #   click_on "New thing"
  #
  #   fill_in "Description", with: @thing.description
  #   fill_in "Name", with: @thing.name
  #   click_on "Create Thing"
  #
  #   assert_text "Thing was successfully created"
  #   click_on "Back"
  # end
  #
  # test "should update Thing" do
  #   visit thing_url(@thing)
  #   click_on "Edit this thing", match: :first
  #
  #   fill_in "Description", with: @thing.description
  #   fill_in "Name", with: @thing.name
  #   click_on "Update Thing"
  #
  #   assert_text "Thing was successfully updated"
  #   click_on "Back"
  # end
  #
  # test "should destroy Thing" do
  #   visit thing_url(@thing)
  #   click_on "Destroy this thing", match: :first
  #
  #   assert_text "Thing was successfully destroyed"
  # end
end

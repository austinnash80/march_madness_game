require "application_system_test_case"

class SchoolsTest < ApplicationSystemTestCase
  setup do
    @school = schools(:one)
  end

  test "visiting the index" do
    visit schools_url
    assert_selector "h1", text: "Schools"
  end

  test "should create school" do
    visit schools_url
    click_on "New school"

    fill_in "Name", with: @school.name
    fill_in "Region", with: @school.region
    fill_in "Seed", with: @school.seed
    check "W1" if @school.w1
    check "W2" if @school.w2
    check "W3" if @school.w3
    check "W4" if @school.w4
    check "W5" if @school.w5
    check "W6" if @school.w6
    click_on "Create School"

    assert_text "School was successfully created"
    click_on "Back"
  end

  test "should update School" do
    visit school_url(@school)
    click_on "Edit this school", match: :first

    fill_in "Name", with: @school.name
    fill_in "Region", with: @school.region
    fill_in "Seed", with: @school.seed
    check "W1" if @school.w1
    check "W2" if @school.w2
    check "W3" if @school.w3
    check "W4" if @school.w4
    check "W5" if @school.w5
    check "W6" if @school.w6
    click_on "Update School"

    assert_text "School was successfully updated"
    click_on "Back"
  end

  test "should destroy School" do
    visit school_url(@school)
    click_on "Destroy this school", match: :first

    assert_text "School was successfully destroyed"
  end
end

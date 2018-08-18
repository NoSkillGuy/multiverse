require "application_system_test_case"

class UniversesTest < ApplicationSystemTestCase
  setup do
    @universe = universes(:one)
  end

  test "visiting the index" do
    visit universes_url
    assert_selector "h1", text: "Universes"
  end

  test "creating a Universe" do
    visit universes_url
    click_on "New Universe"

    fill_in "Id", with: @universe.id
    fill_in "Name", with: @universe.name
    click_on "Create Universe"

    assert_text "Universe was successfully created"
    click_on "Back"
  end

  test "updating a Universe" do
    visit universes_url
    click_on "Edit", match: :first

    fill_in "Id", with: @universe.id
    fill_in "Name", with: @universe.name
    click_on "Update Universe"

    assert_text "Universe was successfully updated"
    click_on "Back"
  end

  test "destroying a Universe" do
    visit universes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Universe was successfully destroyed"
  end
end

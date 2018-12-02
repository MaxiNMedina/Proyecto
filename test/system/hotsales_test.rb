require "application_system_test_case"

class HotsalesTest < ApplicationSystemTestCase
  setup do
    @hotsale = hotsales(:one)
  end

  test "visiting the index" do
    visit hotsales_url
    assert_selector "h1", text: "Hotsales"
  end

  test "creating a Hotsale" do
    visit hotsales_url
    click_on "New Hotsale"

    click_on "Create Hotsale"

    assert_text "Hotsale was successfully created"
    click_on "Back"
  end

  test "updating a Hotsale" do
    visit hotsales_url
    click_on "Edit", match: :first

    click_on "Update Hotsale"

    assert_text "Hotsale was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotsale" do
    visit hotsales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotsale was successfully destroyed"
  end
end

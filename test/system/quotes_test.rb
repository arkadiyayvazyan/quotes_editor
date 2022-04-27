require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) #ref to the first quote
  end

  test "Creating a new quote" do 
    #Quotes#index page -> title with text Quotes
    visit quotes_path
    assert_selector "h1", text: "Quotes"


    #new quote -> new page with new quote title
    click_on "New quote"
    assert_selector "h1", text: "New quote"


    #fill name input with "some quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    #expect new pager with a title "Quotes" and "new quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end

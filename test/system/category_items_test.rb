require "application_system_test_case"

class CategoryItemsTest < ApplicationSystemTestCase
  setup do
    @category_item = category_items(:one)
  end

  test "visiting the index" do
    visit category_items_url
    assert_selector "h1", text: "Category items"
  end

  test "should create category item" do
    visit category_items_url
    click_on "New category item"

    fill_in "Categoryname", with: @category_item.categoryName
    click_on "Create Category item"

    assert_text "Category item was successfully created"
    click_on "Back"
  end

  test "should update Category item" do
    visit category_item_url(@category_item)
    click_on "Edit this category item", match: :first

    fill_in "Categoryname", with: @category_item.categoryName
    click_on "Update Category item"

    assert_text "Category item was successfully updated"
    click_on "Back"
  end

  test "should destroy Category item" do
    visit category_item_url(@category_item)
    click_on "Destroy this category item", match: :first

    assert_text "Category item was successfully destroyed"
  end
end

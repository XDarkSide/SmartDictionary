require "test_helper"

class CategoryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_item = category_items(:one)
  end

  test "should get index" do
    get category_items_url
    assert_response :success
  end

  test "should get new" do
    get new_category_item_url
    assert_response :success
  end

  test "should create category_item" do
    assert_difference("CategoryItem.count") do
      post category_items_url, params: { category_item: { categoryName: @category_item.categoryName } }
    end

    assert_redirected_to category_item_url(CategoryItem.last)
  end

  test "should show category_item" do
    get category_item_url(@category_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_item_url(@category_item)
    assert_response :success
  end

  test "should update category_item" do
    patch category_item_url(@category_item), params: { category_item: { categoryName: @category_item.categoryName } }
    assert_redirected_to category_item_url(@category_item)
  end

  test "should destroy category_item" do
    assert_difference("CategoryItem.count", -1) do
      delete category_item_url(@category_item)
    end

    assert_redirected_to category_items_url
  end
end

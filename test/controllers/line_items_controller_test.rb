require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference("LineItem.count") do
<<<<<<< 73fbbb780ec5aafb3b8bc9bc7da192181be5b8bc
<<<<<<< f54655364e746c5060c571d24ff0f2b94c5c5b86
      post line_items_url, params: {line_item:
        {cart_id: @line_item.cart_id, product_id: @line_item.product_id}}
=======
      post line_items_url, params: {line_item: {cart_id: @line_item.cart_id, product_id: @line_item.product_id}}
>>>>>>> finish manager table
=======
      post line_items_url, params: {line_item:
        {cart_id: @line_item.cart_id, product_id: @line_item.product_id}}
>>>>>>> review
    end

    assert_redirected_to line_item_url(LineItem.last)
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
<<<<<<< 73fbbb780ec5aafb3b8bc9bc7da192181be5b8bc
<<<<<<< f54655364e746c5060c571d24ff0f2b94c5c5b86
    patch line_item_url(@line_item), params: {line_item:
     {cart_id: @line_item.cart_id, product_id: @line_item.product_id}}
=======
    patch line_item_url(@line_item), params: {line_item: {cart_id: @line_item.cart_id,
      product_id: @line_item.product_id}}
>>>>>>> finish manager table
=======
    patch line_item_url(@line_item), params: {line_item:
     {cart_id: @line_item.cart_id, product_id: @line_item.product_id}}
>>>>>>> review
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end

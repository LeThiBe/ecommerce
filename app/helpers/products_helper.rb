module ProductsHelper
  def show_image_for product
    image_tag(product.image.url, class: "img-responsive")
  end

  def bought_this_product_before?
    if logged_in?
      if (@ordered_list = current_user.orders.ids).present?
        @ordered_list.each do |item|
          @check = current_user.orders.find(item).order_details.find_by product_id: params[:id]
          break if @check.present?
        end
      end
      @check.present?
    else false
    end
  end
end

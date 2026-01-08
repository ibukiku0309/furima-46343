class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :condition_id, :fee_id, :prefecture_id,
                                 :shippingtime_id, :price).merge(user_id: current_user.id)
  end
end

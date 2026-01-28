class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record = Record.new
  end
end

class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record = RecordsAddresses.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record = RecordsAddresses.new
    if @record.valid?
      @record.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
end

class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_sold_or_owner, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @record = RecordAddress.new
  end

  def create
    @record = RecordAddress.new(record_address_params)
    if @record.valid?
      pay_item
      @record.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold_or_owner
    return unless @item.record.present? || current_user == @item.user

    redirect_to root_path
  end

  def record_address_params
    params.require(:record_address).permit(:postcode, :prefecture_id, :municipalities, :streetaddress, :building, :phonenumber)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_address_params[:token],
      currency: 'jpy'
    )
  end
end

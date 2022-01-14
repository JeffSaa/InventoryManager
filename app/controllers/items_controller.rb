class ItemsController < ApplicationController

  def index
  	@items = Item.all.where(deleted: false).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to new_item_url, notice: ["Item Created"]
    else
      redirect_to new_item_url, notice: item.errors.full_messages
    end
  end

  private

  def item_params
    params[:item].permit(:name, :description, :quantity)
  end

end
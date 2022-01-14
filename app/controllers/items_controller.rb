class ItemsController < ApplicationController

  def index
  	@items = Item.all.where(deleted: false).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
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

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_url, notice: ["Item Updated"]
    else
      redirect_to item_url, notice: item.errors.full_messages
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.update(deleted: true)
      redirect_to items_path, notice: ["Item Deleted"]
    else
      redirect_to items_path, notice: item.errors.full_messages
    end
  end

  private

  def item_params
    params[:item].permit(:name, :description, :quantity)
  end

end
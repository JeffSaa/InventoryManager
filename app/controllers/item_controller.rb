class ItemController < ApplicationController
	
  def index
  	@items = Item.all.where(deleted: false).order('created_at DESC')
  end
  
end
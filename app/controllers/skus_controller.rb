class SkusController < ApplicationController
  skip_authorization_check

  # GET /units
  # GET /units.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end

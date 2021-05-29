class PriceController < ApplicationController
  def index
    @prices = Price.all.group_by(&:course)

  end
end

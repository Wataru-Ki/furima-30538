class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
    binding.pry
  end
end
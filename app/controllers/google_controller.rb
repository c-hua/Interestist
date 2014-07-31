class GoogleController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
  
    # @page = Page.new
    @garticles = Google.party(params[:page])
  end


end

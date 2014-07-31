class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]


  def index
    @pages = Page.all
    # @page = Page.new
    @articles = Page.party(params[:page])
  end


end

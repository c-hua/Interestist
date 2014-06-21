class GoogleController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Google.all
    # @page = Page.new
    @articles = Google.party(params[:page])
  end

#   # GET /pages/1
#   # GET /pages/1.json
#   def show
    
#     result = @response.body
#     respond_to do |format|
#       format.json { render :json => JSON.parse(@result) }
#       format.html { render "index.html.erb" }
# end
#   end

#   # GET /pages/new
#   def new
#     @google = Google.new
#   end

#   # GET /pages/1/edit
#   def edit
#   end

#   # POST /pages
#   # POST /pages.json
#   def create
#     @google = Google.new(page_params)

#     respond_to do |format|
#       if @google.save
#         format.html { redirect_to @google, notice: 'Page was successfully created.' }
#         format.json { render action: 'show', status: :created, location: @google }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @google.errors, status: :unprocessable_entity }
#       end
#     end
#   end



#   # PATCH/PUT /pages/1
#   # PATCH/PUT /pages/1.json
#   def update
#     respond_to do |format|
#       if @google.update(page_params)
#         format.html { redirect_to @google, notice: 'Page was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: 'edit' }
#         format.json { render json: @google.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /pages/1
#   # DELETE /pages/1.json
#   def destroy
#     @google.destroy
#     respond_to do |format|
#       format.html { redirect_to pages_url }
#       format.json { head :no_content }
#     end
  # end


end

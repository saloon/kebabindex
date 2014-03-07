require "digest/md5"

class Admin::StoresController < ApplicationController
  before_filter :authenticate
  layout 'admin'
  before_action :set_store, only: [:show, :edit, :update, :destroy, :approve]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    @store.approved = true

    respond_to do |format|
      if @store.save
        format.html { redirect_to admin_store_path(@store), notice: 'Store was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to admin_store_path(@store), notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to admin_stores_path }
      format.json { head :no_content }
    end
  end

  def approve
    @store.update_attribute(:approved, true)
    redirect_to admin_stores_path, notice: "Approved #{@store.name}"
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      Digest::MD5.hexdigest(password) == ENV["INDEX_PASSWORD"]
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id] || params[:store_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address, :latitude, :longitude)
    end
end

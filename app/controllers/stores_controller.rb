class StoresController < ApplicationController

  # GET /stores/new
  def new
    @store = Store.new
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to new_store_path, notice: 'Danke für deinen Eintrag. Wir werden ihn schnellstmöglich überprüfen.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address)
    end
end

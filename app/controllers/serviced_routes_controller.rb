class ServicedRoutesController < ApplicationController
  before_action :set_serviced_route, only: [:show, :edit, :update, :destroy]

  # GET /serviced_routes
  # GET /serviced_routes.json
  def index
    @serviced_routes = ServicedRoute.all
  end

  # GET /serviced_routes/1
  # GET /serviced_routes/1.json
  def show
  end

  # GET /serviced_routes/new
  def new
    @serviced_route = ServicedRoute.new
  end

  # GET /serviced_routes/1/edit
  def edit
  end

  # POST /serviced_routes
  # POST /serviced_routes.json
  def create
    @serviced_route = ServicedRoute.new(serviced_route_params)

    respond_to do |format|
      if @serviced_route.save
        format.html { redirect_to @serviced_route, notice: 'Serviced route was successfully created.' }
        format.json { render :show, status: :created, location: @serviced_route }
      else
        format.html { render :new }
        format.json { render json: @serviced_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serviced_routes/1
  # PATCH/PUT /serviced_routes/1.json
  def update
    respond_to do |format|
      if @serviced_route.update(serviced_route_params)
        format.html { redirect_to @serviced_route, notice: 'Serviced route was successfully updated.' }
        format.json { render :show, status: :ok, location: @serviced_route }
      else
        format.html { render :edit }
        format.json { render json: @serviced_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serviced_routes/1
  # DELETE /serviced_routes/1.json
  def destroy
    @serviced_route.destroy
    respond_to do |format|
      format.html { redirect_to serviced_routes_url, notice: 'Serviced route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serviced_route
      @serviced_route = ServicedRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serviced_route_params
      params.require(:serviced_route).permit(:route_id, :service_provider_id)
    end
end

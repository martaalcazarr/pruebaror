class MaintenanceTypesController < ApplicationController
  before_action :set_maintenance_type, only: %i[ show edit update destroy ]

  # GET /maintenance_types or /maintenance_types.json
  def index
    @maintenance_types = MaintenanceType.all
  end

  # GET /maintenance_types/1 or /maintenance_types/1.json
  def show
  end

  # GET /maintenance_types/new
  def new
    @maintenance_type = MaintenanceType.new
  end

  # GET /maintenance_types/1/edit
  def edit
  end

  # POST /maintenance_types or /maintenance_types.json
  def create
    @maintenance_type = MaintenanceType.new(maintenance_type_params)

    respond_to do |format|
      if @maintenance_type.save
        format.html { redirect_to maintenance_type_url(@maintenance_type), notice: "Maintenance type was successfully created." }
        format.json { render :show, status: :created, location: @maintenance_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_types/1 or /maintenance_types/1.json
  def update
    respond_to do |format|
      if @maintenance_type.update(maintenance_type_params)
        format.html { redirect_to maintenance_type_url(@maintenance_type), notice: "Maintenance type was successfully updated." }
        format.json { render :show, status: :ok, location: @maintenance_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_types/1 or /maintenance_types/1.json
  def destroy
    @maintenance_type.destroy

    respond_to do |format|
      format.html { redirect_to maintenance_types_url, notice: "Maintenance type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_type
      @maintenance_type = MaintenanceType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_type_params
      params.require(:maintenance_type).permit(:name)
    end
end

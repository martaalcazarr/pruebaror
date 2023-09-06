class MaintenancesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions

  # GET /maintenances or /maintenances.json
  def index
    @maintenances = Maintenance.all.page(params[:page]).per(10) # 10 elementos por página, puedes ajustar este número
  end

  # GET /maintenances/1 or /maintenances/1.json
  def show
    @maintenance = Maintenance.find(params[:id])
  end

  # GET /maintenances/new
  def new
    @maintenance = Maintenance.new
    @equipment_types = EquipmentType.all  
    @motors_for_equipment_type_1 = Motor.where(equipment_type_id: 1)  
    @motors_for_equipment_type_2 = Motor.where(equipment_type_id: 2)  
  end

  # GET /maintenances/1/edit
  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  # POST /maintenances or /maintenances.json
  def create
    @maintenance = Maintenance.new(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to maintenance_url(@maintenance), notice: "Maintenance was successfully created." }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1 or /maintenances/1.json
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to maintenance_url(@maintenance), notice: "Maintenance was successfully updated." }
        format.json { render :show, status: :ok, location: @maintenance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1 or /maintenances/1.json
  def destroy
    if current_user.administrador?
      @maintenance.destroy
      respond_to do |format|
        format.html { redirect_to maintenances_url, notice: "Maintenance was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      flash[:error] = 'No tienes permiso para eliminar mantenimientos.'
      redirect_back(fallback_location: root_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def check_permissions
      if current_user.role == "administrador" || current_user.role == "operador"

      else
        flash[:error] = 'No tienes permiso para realizar esta acción.'
        redirect_back(fallback_location: root_path)
      end
    end

    # Only allow a list of trusted parameters through.
    def maintenance_params
      params.require(:maintenance).permit(:motor_id, :date, :email, :motor_id, :maintenance_type_id, :city_id)
    end
end

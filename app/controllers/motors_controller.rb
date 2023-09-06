class MotorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions, except: [:index, :show]

  # GET /motors or /motors.json
  def index
    @motors = Motor.page(params[:page]) 
  end

  # GET /motors/1 or /motors/1.json
  def show
    @motor = Motor.find(params[:id])
  end

  # GET /motors/new
  def new
    @motor = Motor.new
  end

  # GET /motors/1/edit
  def edit
    @motor = Motor.find(params[:id])
  end

  # POST /motors or /motors.json
  def create
    @motor = Motor.new(motor_params)
    @motor.user = current_user

    if @motor.save
      redirect_to @motor, notice: 'Motor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /motors/1 or /motors/1.json
  def update
    respond_to do |format|
      if @motor.update(motor_params)
        format.html { redirect_to motor_url(@motor), notice: "Motor was successfully updated." }
        format.json { render :show, status: :ok, location: @motor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @motor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motors/1 or /motors/1.json
  def destroy
    @motor.destroy

    respond_to do |format|
      format.html { redirect_to motors_url, notice: "Motor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motor
      @motor = Motor.find(params[:id])
    end

    def check_permissions
      if current_user.role == "administrador" 
        
      else
        flash[:error] = 'No tienes permiso para realizar esta acción.'
        redirect_back(fallback_location: root_path)
      end
    end

    # Only allow a list of trusted parameters through.
    def motor_params
      params.require(:motor).permit(:name, :description, :photo, :user_id, :equipment_type_id)
    end
end

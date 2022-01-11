class AppointmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def create
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render "new"
    end
  end

  def edit
    @patients = Patient.all
    @physicians = Physician.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render "edit"
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:physician_id, :patient_id, :appointment_date)
  end
end

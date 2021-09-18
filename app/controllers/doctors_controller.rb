class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :destroy]

  def index
    @doctors =  Doctor.all
  end
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(doctor_params)

    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
    def set_course
      @doctor = Doctor.find(params[:id])
    end

    def course_params
      params.require(:doctor).permit(:first_name, :last_name, :specialty)
    end
end
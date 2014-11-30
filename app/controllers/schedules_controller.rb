class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = "Scheduled!"
      redirect_to schedules_new_path
    else
      render root_path
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def index
  end

  def show
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:note, :start_time, :user_id, :date)
    end
end

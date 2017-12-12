class ExercisesController < ApplicationController
    include SessionsHelper
    def exercise_params
        params.require(:exercise).permit(:name, :muscle, :description)
    end
    
    def index
        @exercises = Exercise.all
    end
    def show
        @exercise = Exercise.find params[:id] #look up exercise by unique muscle id
    end
    def new
        @exercise = Exercise.new
    end
    def create
        @exercise = Exercise.create!(exercise_params)
        flash[:notice] = "#{@exercise.muscle} was successfully created."
        redirect_to exercises_path
    end
    
    def destroy
        @exercise = Exercise.find params[:id]
        @exercise.destroy
        flash[:notice] = "Exercise '#{@exercise.muscle}' deleted."
        redirect_to exercises_path
    end
    def edit
        @exercise = Exercise.find params[:id]
    end
    
    def update
        @exercise = Exercise.find params[:id]
        @exercise.update_attributes!(exercise_params)
        flash[:notice] = "#{@exercise.muscle} was successfully updated."
        redirect_to exercise_path(@exercise)
           # redirect_to :action => 'show', :id => @exercise.id

    end
end
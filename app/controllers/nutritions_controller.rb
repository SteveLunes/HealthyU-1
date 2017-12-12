class NutritionsController < ApplicationController
    include SessionsHelper
    def nutrition_params
        params.require(:nutrition).permit(:height,:weight, :age)
    end
    def index
        @nutritions = Nutrition.all
    end

    def new
        @nutrition = Nutrition.new
    end
    def show
        @nutrition = Nutrition.find params[:id]
    end
    def create
        @nutrition = Nutrition.create!(nutrition_params)
        if @nutrition.save
            redirect_to nutritions_path, notice: "Nutrition was successfully created"
        end
       # flash[:notice] = "#{@nutrition.height} was successfully created."
        #redirect_to nutritions_path
    end
    def update 
        @nutrition = Nutrition.find params[:id]
        @nutrition.update_attributes!(nutrition_params)
        flash[:notice] = "#{@nutrition.height} was successfully updated."
        redirect_to nutrition_path(@nutrition)
    end
    def edit
        @nutrition = Nutrition.find params[:id]
    end
    def destroy
        @nutrition = Nutrition.find params[:id]
        @nutrition.destroy
        flash[:notice] = "Nutrition '#{@nutrition.height}' deleted."
        redirect_to nutritions_path
    end

end
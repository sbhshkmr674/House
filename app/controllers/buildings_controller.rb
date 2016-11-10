class BuildingsController < ApplicationController

	def index
		@buildings=Building.all
	end

	def new
		@building=current_user.buildings.build
	end
	 
	def create
	 	@building=current_user.buildings.build(building_params)

	 	if @building.save
	 		flash[:success]="You have successfully created the Building"
	        redirect_to buildings_path	
	 	else
	 		flash[:alert]="Something happing wrong !!"
	 		render 'new'
	 	end
	end

	def show
		@building=Building.find(params[:id])
		@floor=Floor.new

	end

	def destroy
		@building=Building.find(params[:id])

		if @building.destroy
			flash[:success]= "Building successfully destroyed"
		else
			flash[:alert]='Something happing wrong'
		end
	end

	def update
    @building = Building.find(params[:id])
  @building.update(building_params)
  redirect_to(building_path(@building))
  end
	
	private

	def building_params
		params.require(:building).permit(:description, :image)
	end
end

class FloorsController < ApplicationController
	
   def index
     @floors=buildings.floors.all
   end
	def create
		@building = Building.find(params[:building_id])
		 @floor=@building.floors.build(floor1_params)
		
		if @floor.save
		 	flash[:success]= "Your floor is created"
		 	redirect_to floors_path
		 else
		 	flash[:alert]="Something happning wrong"
		 	render 'new'
	     end
	end

	def show 
		@floor=@building.floors.find(params[:building_id])
	    
	end
	def update  
  @floor = Floor.find(params[:building_id])
  @floor.update(post_params)
  redirect_to(floor_path(@floor))
end  

	private 
	 def floor1_params
	  params.require(:floor).permit(:floor ,:image)
	end
end

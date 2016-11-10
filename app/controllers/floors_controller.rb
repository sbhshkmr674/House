class FloorsController < ApplicationController
	before_action :set_building

   def index
     @floors=buildings.floors.all
   end

   def new
       @building=Building.find(:building_id)
       @floor=Floor.new
   end
	def create
		@building = Building.find(params[:building_id])
		 @floor=@building.floors.build(floor1_params)
		
		if @floor.save
		 	flash[:success]= "Your floor is created"
		 	redirect_to :back
		 else
		 	flash[:alert]="Something happning wrong"
		 	render root_path
	     end
	end

	def show 
		#@floor=@building.floors.find(params[:building_id])
	    @floor=Floor.find(params[:id])
	    @room=Room.new
	end
 	def update  
       @floor = Floor.find(params[:building_id])
       @floor.update(post_params)
       redirect_to(floor_path(@floor))
    end 
    def destroy  
  @floor = @building.floors.find(params[:id])

  @building.destroy
  flash[:success] = "Building deleted :("
  redirect_to root_path
end   

	private 
	 def floor1_params
	  params.require(:floor).permit(:floor_name ,:image)
	end

	def set_building  
      @building = Building.find(params[:building_id])
    end  
end

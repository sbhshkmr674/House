class RoomsController < ApplicationController
   
    #before_action :set_floor
    def index
    	@rooms=floors.rooms.all
    end

    def new 
    	#@building=Building.find(:building_id)
    	@floor=Floor.find(params[:floor_id])
    	@room=Room.new
    end
	def create
		#@building=Building.find(:building_id)
		@floor=Floor.find(params[:floor_id])
		@room=@floor.rooms.build(room_params)

		if @room.save
			flash[:success]="U created room"
			redirect_to new_building_floor_room_path
		else
			flash[:alert]="Sorry Something happening wrong"
			render 'new'
		end
	end

	def show
		#@room=@floor.rooms.find(params[:floor_id])
	    @room=Room.find(params[:id])
	end

	private
	def room_params
		params.require(:room).permit( :image)
	end

	def set_floor
		#@building=Building.find(params[:building_id])
		#@floor=Floor.find(params[:floor_id])
	end
end

class RoomsController < ApplicationController
   
    def index
    	@rooms=@floors.rooms.all
    end
	def create
		@floor=Floor.find(params[:floor_id])
		@room=@floor.rooms.builds(room_params)

		if @room.save
			flash[:success]="U created room"
			redirect_to new_building_floor_room_path
		else
			flash[:alert]="Sorry Something happening wrong"
			render 'new'
		end
	end

	def show
		@room=@floor.rooms.find(params[:floor_id])
	end

	private
	def room_params
		params.require(:room).permit(:floor, :image)
	end
end

class EventsController < ApplicationController
	def index
		@events = Event.all.order("event_order")
	end

	def show
		@event = Event.find(params[:id])

	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			redirect_to @event
		else
			render :new
		end

	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])

		if @event.update(product_params)
			redirect_to events_path
		else
			render :edit
		end
		
	end

	def destroy
		@event = Event.find(params[:id])

		@event.destroy
		redirect_to events_path
	end

	def location
		respond_to do |format|
			format.json {render :json => {:message => "success"}}
			format.js {render :nothing => true}
		end
		if params["locations"]
			@locations = params["locations"].map {|hash| hash.inject({}) {|item,(k,v)| item[k.to_sym]=v;item}}
			puts @locations
			Event.update_location(@locations)
		end
	end

	private

		def event_params
			params.require(:event).permit(:title, :content)
		end
end

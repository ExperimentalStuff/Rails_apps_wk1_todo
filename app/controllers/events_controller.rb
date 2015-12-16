class EventsController < ApplicationController
	def index
		@events = Event.all.order("id desc")
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
			redirect_to events_path
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
		@product = Product.find(params[:id])

		@product.destroy
		redirect_to events_path
	end

	private

		def event_params
			params.require(:event).permit(:title, :content)
		end
end

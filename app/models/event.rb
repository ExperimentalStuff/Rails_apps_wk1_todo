class Event < ActiveRecord::Base
	after_create :set_default_order

	def set_default_order
		if !self.event_order
			self.event_order = self.id
			save
		end
	end
end

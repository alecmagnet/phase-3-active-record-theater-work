class Role < ActiveRecord::Base
	has_many :auditions

	def actors
		self.auditions.map do |aud| 
			aud.actor
		end
	end

	def locations
		self.auditions.map do |aud| 
			aud.location
		end
	end

	def lead
		lead_actor = self.auditions.where(hired: true).first
		lead_actor == nil ? 'no actor has been hired for this role' : lead_actor
	end

	def understudy
		actors = self.auditions.where(hired: true)
		actors[1] == nil ? 'no actor has been hired for understudy for this role' : actors[1]
	end
end
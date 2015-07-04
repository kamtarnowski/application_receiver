class Submission < ActiveRecord::Base

	after_create :cost_and_term

	validates_presence_of :email, :description, :category
	validates :description, length: { minimum: 100 }
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
	validates :category, inclusion: { in: ['awaria', 'uszkodzenie', 'usterka'] }

	def cost_and_term
		case self.category
		when 'awaria'
			if Time.now.strftime('%H').to_i >= 9 && Time.now.strftime('%H').to_i < 17
				self.update(cost: 50, term: Time.now + 240)
			else
				self.update(cost: 100, term: Time.now + 240)
			end
		when 'uszkodzenie'
			self.update(cost: 10, term: 1.day.from_now)
		else
			self.update(cost: 1, term: 3.days.from_now)
		end
	end

end

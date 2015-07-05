class ApplicationReceiver

	def filter_result(x)
		Submission.where(status: 'unread').order('created_at ASC').limit(a).pluck(x).to_a
	end

	def output(a, b = nil)
		if b
			case b.select { |a, b| b == 'true' }
			when b.has_key?('category')
				filter_result(:category)
			when b.has_key?('description')
				filter_result(:description)
			when b.has_key?('email')
				filter_result(:email)
			else
				unread_sub = Submission.where(status: 'unread').order('created_at ASC').limit(a).to_a
			end
		else
			unread_sub = Submission.where(status: 'unread').order('created_at ASC').limit(a).to_a
			unread_sub.each do |s|
				Submission.all.find(s.id).update(status: 'read')
			end
		end
	end

end
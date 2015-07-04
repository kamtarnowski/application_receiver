class ApplicationReceiver

	def output(a)
		unread_sub = Submission.where(status: 'unread').order('created_at ASC').limit(a).to_a
		unread_sub.each do |s|
			Submission.all.find(s.id).update(status: 'read')
		end
	end

end
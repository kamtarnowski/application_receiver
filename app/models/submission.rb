class Submission < ActiveRecord::Base

	validates_presence_of :email, :description, :category
	validates :description, length: { minimum: 100 }
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
	valdiates :category, inclusion: { in: ['awaria', 'uszkodzenie', 'usterka'] }

end

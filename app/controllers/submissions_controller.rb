class SubmissionsController < ApplicationController

	def new
		@submission = Submission.new
	end

	def create
		@submission = Submission.new(submission_params)

		if @submision.save
			flash[:success] = 'Submission created successfully.'
			redirect_to :back
		else
			flash[:error] = "Couldn't send the Submission."
			render :new
		end

	end

	private
		def submission_params
			params.require(:submission).permit(:description, :category, :email)
		end

end

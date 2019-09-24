class Admins::AdminsController < ApplicationController

	def index
		@users = User.all
	end


end
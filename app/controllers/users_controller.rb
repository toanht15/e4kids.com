class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
		:following, :followers]
		def index

			if params[:search]
				@users = User.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
			else
				@users = User.paginate(page: params[:page])
			end
		end

		def show
			@user = User.find(params[:id])
		end

		def following
			@title = "Following"
			@user  = User.find(params[:id])
			@users = @user.following.paginate(page: params[:page])
			render 'show_follow'
		end

		def followers
			@title = "Followers"
			@user  = User.find(params[:id])
			@users = @user.followers.paginate(page: params[:page])
			render 'show_follow'
		end
		
		private

		def logged_in_user
			unless user_signed_in?
				#store_location
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
		end
	end

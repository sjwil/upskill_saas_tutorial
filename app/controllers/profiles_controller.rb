class ProfilesController < ApplicationController
  # GET to /users/:user_id/profile/new 
  def new
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile updated"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  
  # Whitelisting the params to use, prevents injecting
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
end
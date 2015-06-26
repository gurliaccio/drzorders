class CheckupsController < ApplicationController
  #before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:index, :show]
  before_action :correct_user,   except: [:new, :create, :index, :show]

  def index
    @gender = params[:gender]
    @age = params[:age]
    @checkups = Checkup.search(current_user, @gender, @age)

    # delete old checkup data for current_user
    # current_user.checkups.each do |checkup|
    #   checkup.destroy
    # end

    # save new checkup data for current_user
    @checkups.each do |checkup|
      checkup.save
    end

    
  end

  def create
    @active = 'checkups'
    @checkup = Checkup.new(checkup_params)
    @checkup = current_user.checkup.new(checkup_params) 
    if @checkup.save
    #flash[:success] = "List created."
    redirect_to checkups_path
  #   else
  #     render 'new'
    end
  end

  def checkup_params
    params.require(:checkup).permit(:gender, :age)
  end

  private

    def correct_user
      unless current_user?(@item.user) || current_user.admin?
        redirect_to user_path(current_user)
      end
    end
    
end
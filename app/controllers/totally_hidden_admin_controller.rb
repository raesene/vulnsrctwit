
class TotallyHiddenAdminController < ApplicationController
  layout "totally_hidden_admin"
def index
  @users = User.find(:all)
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])

  respond_to do |format|
    if @user.update_attributes(params[:user])
      format.html { redirect_to :action => :index, notice: 'User was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

end

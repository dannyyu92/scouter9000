class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(decode(params[:user]))
    if @user.save
      render :json => {:state => {:code => 0}, :data => @user }
    else
      render :json => {:state => {:code => 1, :messages => @user.errors.full_messages} }
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

  def decode(input)
    input.gsub("%5B", "[").gsub("%5D", "]")
  end
end
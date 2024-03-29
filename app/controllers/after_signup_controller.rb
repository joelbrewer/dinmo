class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_username, :add_mobile_number

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attribute(:status, step.to_s)
    @user.update_attribute(:status, 'active') if step == steps.last
    @user.update_attributes(user_params)
    render_wizard @user
  end

  def finish_wizard_path
    current_user.update_normalized_number
    tutorial_path
    #users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :mobile_number, :mobile_number_normalized, :expertise, :zipcode, :tags)
  end
  
end

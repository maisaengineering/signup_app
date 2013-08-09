class SignupController < ApplicationController
  def new
    @signup = Signup.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
    end
  end

  def create
    @signup = Signup.new(email: params["email"], zipcode: params["zipcode"])

    if @signup.save!
      render :json => { :message => 'Ok' }, content_type: "application/json"
    else
      render :json => { :message => 'Not Ok' }, :status => 422
    end
  end
end
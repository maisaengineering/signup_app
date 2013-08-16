class SignupController < ApplicationController
  def new
    @signup = Signup.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
    end
  end

  def create
    if params && !params[:email].blank?
      @signup = Signup.new(email: params["email"], zipcode: params["zipcode"])
    else
      @signup = Signup.new(email: params["signup"]["email"], zipcode: params["signup"]["zipcode"])
    end
    respond_to do |format|
      if @signup.save
        @message ="Successfully Created"
        flash[:notice] = "Successfully Created"
      else
        @message = ""
        @signup.errors.messages.each do |k,v|
          @message +=  v.flatten.first.to_s + " "
        end
        flash[:notice] = @message
      end

      format.json do
        render :partial => 'signup/create',formats: [:js]
        #render :text=> "hello"
      end
      format.html do
        #render :action=>'new'
        #redirect_to signup_new_path
      end
    end
  end
end
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
    respond_to do |format|
      begin
        if @signup.save
          @status = "Success"
          @message ="successfully created"
        else
          @status = "Failed"
          @message ="Already exists"
        end
      rescue Exception => e
        @status = "Failed"
        @message ="Something went wrong!"
      end

      format.json {render :partial => "signup/create.json.erb"}
    end
  end
end
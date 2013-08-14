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
      if @signup.save
        @message ="Successfully Created"
      else
        @message = ""
        @signup.errors.messages.each do |k,v|
          @message +=  v.flatten.first.to_s + " "

        end
      end

      format.json do
        render :partial => 'signup/create',formats: [:js]
        #render :text=> "hello"
      end
    end
  end
end
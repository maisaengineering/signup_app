class SignupController < ApplicationController
  def new
     @signup = Signup.new
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
     end
  end

  def create
     @signup = Signup.new(params[:signup])

     respond_to do |format|
      if @signup.save
        format.html { redirect_to root_url, notice: 'successfully created'  }
        format.json { render json: @signup, status: :created, location: @signup }
      else
        format.html { render action: "new" }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
     end

  end
end

class Signup < ActiveRecord::Base
  attr_accessible :email, :zipcode

  validates :zipcode, :numericality => {:message => "Enter only digits"} 
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Invaild E-mail Format"
end

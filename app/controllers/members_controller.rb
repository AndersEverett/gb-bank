class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@members = Member.all
  end

  def edit
  	Rails.logger.info(params)
  	@member = Member.find(params[:id])
  end

  def new
  	@member = Member.new
  end

  def create
  	@member = Member.new
  	@member.name = params['member']['name']
  	@member.email = params['member']['email']
  	begin 
  	  @member.save!
  	  redirect_to(members_path)
  	rescue=>e
  	  redirect_to(members_path, flash: { error: "#{e}. Error. Member not saved."})
  	end	
  end

  def update
    begin 
      Member.update(params["id"], name: params["member"]["name"], email: params["member"]["email"])
      redirect_to(members_path)	
    rescue=>e
      redirect_to(members_path, flash: { error: "#{e}. Error. Member not updated."})
    end	
  end
end

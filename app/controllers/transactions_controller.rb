class TransactionsController < ApplicationController
  before_action :authenticate_user!, unless: "Rails.env.test?" 
  
  def new
  	@transaction = Transaction.new
  end

  def create
  	@transaction = Transaction.new()
  	@transaction.transaction_date = DateTime.new(params['transaction_date']['year'].to_i, params['transaction_date']['month'].to_i, params['transaction_date']['day'].to_i)
  	@transaction.amount = params['transaction']['amount']
  	@transaction.description = params['transaction']['description']
  	@transaction.assign_member_id(params['identifier']['member_email'])
  	begin
  	  @transaction.save!
  	  redirect_to(members_path)
  	rescue=>e
  	  Rails.logger.info(e)
      redirect_to(members_path, flash: { error: "#{e}. Error. Transaction not saved."})
  	end
  end

end

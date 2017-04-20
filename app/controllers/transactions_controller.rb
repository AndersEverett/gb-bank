class TransactionsController < ApplicationController
  def new
  	@transaction = Transaction.new
  end

  def create

  	@transaction = Transaction.new()
  	@transaction.transaction_date = DateTime.new(params['transaction_date']['year'].to_i, params['transaction_date']['month'].to_i, params['transaction_date']['day'].to_i)
  	@transaction.amount = params['transaction']['amount']
  	@transaction.description = params['transaction']['description']
  	member = Member.find_by_email(params['identifier']['member_email'])
  	@transaction.member_id = member.id if member
  	begin
  	  @transaction.save!
  	  redirect_to(members_path)
  	rescue=>e
      redirect_to(members_path, flash: { error: "#{e}. Error. Transaction not saved."})
  	end
  end

  private
    #implement strong params??
    # def transaction_params
    #   params.require(:transaction).permit(transaction_date: [:year, :month, :day], identifier: [:member_email])
    # end
end

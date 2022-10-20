class TransfersController < ApplicationController
  def index
    @transfers = Transfer.all
  end

  def new
    @customers = Customer.all
  end

  def create 
    if permitted[:sender_id]==permitted[:receiver_id]
      flash[:error] = 'sender can not be same as receiver'
      redirect_to new_transfer_path
      return
    end
    @transfer = Transfer.new(
      sender_id: permitted[:sender_id], receiver_id: permitted[:receiver_id], amount: permitted[:amount])
    @receiver = Customer.find(permitted[:receiver_id])
    @receiver.update_column(:current_balance, @receiver.current_balance + permitted[:amount].to_i)
    @sender = Customer.find(permitted[:sender_id])
    @sender.update_column(:current_balance, @sender.current_balance - permitted[:amount].to_i)
    if @transfer.save
      flash[:notice] = 'Money transfered successfully'
      redirect_to transfers_path
    else
      flash[:error] = 'Something went wrong transfer aborted'
      redirect_to new_transfer_path
    end

  end

  private 

  def permitted
    params.require(:transfer).permit(:sender_id, :receiver_id, :amount)
  end
end

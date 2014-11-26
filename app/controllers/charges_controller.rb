class ChargesController < ApplicationController

	after_action :clear_charge_from_session, only: [:create]

	def new
		# Amount in cents
		session[:amountInCents] = params[:amountInCents].to_i
		@amountInDollars = session[:amountInCents].to_i/100
	end

	def create

		#get how much we're going to charge
		@amountInCents = session[:amountInCents]

		#convert to dollars for convenience when displaying in the view
		@amountInDollars = @amountInCents/100

		#create the customer with the info from the Checkout view
		customer = Stripe::Customer.create(
				:email => params[:stripeEmail],
				:card  => params[:stripeToken]
		)

		#create the charge
		charge = Stripe::Charge.create(
				:customer    => customer.id,
				:amount      => @amountInCents,
				:description => 'Rails Stripe customer',
				:currency    => 'usd',
		)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to charges_path
	end

	private
	def clear_charge_from_session
		#clear the amountInCents from the session
		session.delete(:amountInCents)
	end

end

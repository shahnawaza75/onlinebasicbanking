class CustomersController < ApplicationController
    def home 
    end

    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end
end

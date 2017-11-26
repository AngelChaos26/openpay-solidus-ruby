module Spree
class Spree::StaticController < Spree::StoreController
	skip_before_filter :verify_authenticity_token
	
	def create_conekta
        #Openpay
        #Conekta.api_key = "sk_2853187090f64263912af082466c0f5b"
        
        #Openpay
        #'name' => $_POST["name"],
        #'last_name' => $_POST["last_name"],
        #'phone_number' => $_POST["phone_number"],
        #'email' => $_POST["email"],);
        
        #order_conekta
        #costumer_conekta
        
        order_openpay(params[:token_id], params[:deviceIdHiddenFieldName])
        #costumer_openpay
        
        #respond_to do |format|
        #    format.html 
        #    format.json { render json: @entry }
        #end
	end
end
end

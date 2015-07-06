class PermitsController < ApplicationController
   
   def create
      @permit = Permit.new(permit_params)
      respond_to do |format|
         if @permit.save
            format.js
         end
      end
   end
    
   def new
      @permit = Permit.new
   end
   
   private
   
   def permit_params
      params.require(:permit).permit(:permitHolder, :client_id, :crid, :nonprofitAuthorizationNumber, :postOffice, :contact_id, :permit_number)
   end
end
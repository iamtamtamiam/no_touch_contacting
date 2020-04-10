class ContactsController < ApplicationController

    def new
        @contact = Contact.new
    end 

    def index #change it to only current_employee's contacts
        @contacts = Contact.all
    end 

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to contact_path(@contact)
        else
            render new_contact_path
        end 

    end 

    def show
        @contact = Contact.find_by(id: params[:id])
        redirect_to new_contact_path if !@contact
    end 

    private

    def contact_params
        params.require(:contact).permit(:name, :description, :notes)
    end 

end

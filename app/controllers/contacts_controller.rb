class ContactsController < ApplicationController

    def new
        @contact = Contact.new
    end 

    def index #change it to only current_employee's contacts
        @contacts = Contact.all.alpha
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

    def edit
        @contact = Contact.find_by(id: params[:id])
        redirect_to contacts_path if !@contact
        #add flash message for this contact doesnt exist
        #any user can edit contact...as long as logged in
        # maybe add last upadated by? on the show page
    end 

    def update
        @contact = Contact.find_by(id: params[:id])
        redirect_to contacts_path if !@contact
        if @contact.update(contact_params)
            redirect_to contact_path(@contact)
        else
            render :edit #will this work
            #add flash message before
        end 
    end 

    private

    def contact_params
        params.require(:contact).permit(:name, :description, :notes)
    end 

end

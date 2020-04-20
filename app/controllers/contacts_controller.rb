class ContactsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_contact_by_id, only: [:show, :edit, :update]

    layout 'layouts/user'
    def new
        @contact = Contact.new
    end 

    def index
        @contacts = Contact.alpha
    end 

    def most_frequently_contacted #scope url
        @contacts = Contact.most_frequent
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
    end 

    def edit
    end 

    def update
        if @contact.update(contact_params)
            redirect_to contact_path(@contact)
        else
            render :edit
        end 
    end 

    private

    def set_contact_by_id
        @contact = Contact.find_by(id: params[:id])
        redirect_to contacts_path if !@contact

    end 

    def contact_params
        params.require(:contact).permit(:name, :description, :notes)
    end 

end

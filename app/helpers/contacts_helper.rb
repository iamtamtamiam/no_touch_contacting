module ContactsHelper

    def contact_date(contact_info)
        contact_info.strftime("%b %d, %Y at%l:%M%P")
    end 

end

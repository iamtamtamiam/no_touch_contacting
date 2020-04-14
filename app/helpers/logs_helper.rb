module LogsHelper

    def answered_yesno(log)
        if log.answered == true
            return "Yes"
        else
            return "No"
        end 
    end 

    def display_date(log)
        log.date.strftime("%A - %B %d, %Y at%l:%M%P")
    end 


end

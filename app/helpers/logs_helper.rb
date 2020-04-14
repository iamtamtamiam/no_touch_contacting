module LogsHelper

    def answered_yesno(log)
        if log.answered == true
            return "Yes"
        else
            return "No"
        end 
    end 

end

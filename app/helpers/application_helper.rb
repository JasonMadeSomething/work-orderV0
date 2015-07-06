module ApplicationHelper
    
    def active_tab?(controller_name, action_name, links_to)
        if links_to == 'Clients'
            if controller_name == 'client' || (action_name == 'client_schedule' || action_name == 'client_archive')
                return true
            end
        end
        if links_to == 'Work Orders'
            if controller_name == 'work_order' && !(action_name == 'client_archive' || action_name == 'client_schedule')
                return true
            end
        end
        false
    end
    

end

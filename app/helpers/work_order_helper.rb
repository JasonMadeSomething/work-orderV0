module WorkOrderHelper
    
    def append_client(client_id)
      "for " + Client.find(client_id).name
    end
    
end

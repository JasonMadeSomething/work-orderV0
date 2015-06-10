FactoryGirl.define do
    factory :client_seq, class: Client do
        sequence(:clientnumber) { |i| "%03d" % i }
        sequence(:name) { |i| "client #{i}" }
    end
    
    factory :client do
        clientnumber "880"
        name "Imperial Press Direct"
        initialize_with {Client.find_or_create_by(clientnumber: clientnumber)}
        
        factory :client_1 do
            clientnumber "123"
            name "Fakie 1"
            
        end
    end
end
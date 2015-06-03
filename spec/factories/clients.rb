FactoryGirl.define do
    factory :client_seq, class: Client do
        sequence(:clientnumber) { |i| "%03d" % i }
        sequence(:name) { |i| "client #{i}" }
    end
    
    factory :client do
        clientnumber "880"
        name "Imperial Press Direct"
    end
end
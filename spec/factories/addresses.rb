FactoryGirl.define do
    factory :address do
        address1 "1234 street street"
        address2 "apt #10"
        city "St.Petersburg"
        state "FL"
        zip "12345"
    end
    
    factory :address_seq, class: Address do
        sequence(:address1) { |i| "#{i} street street"}
        address2 "apt #10"
        city "St.Petersburg"
        state "FL"
        zip "12345"
    end
end
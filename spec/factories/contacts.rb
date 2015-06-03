FactoryGirl.define do
    factory :contact do
        name "John Smith"
        association :client
        association :address
    end
    
end
        
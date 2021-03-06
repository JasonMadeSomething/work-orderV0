FactoryGirl.define do
  factory :status_active, class: Status  do
    description "Active"
    initialize_with {Status.find_or_create_by(description: description)}
    
    factory :status_completed do
      description "Completed"
    end
    
    factory :status_held do
      description "On Hold"
    end
    
    factory :status_deleted do
      description "Delete"
    end
    
    factory :status_mailed do
      description "Mailed"
    end
  end
end

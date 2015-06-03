FactoryGirl.define do
  factory :work_order do
    association :client
    dueDate 5.days.from_now
    
    factory :mailing_work_order do
      association :project_type, factory: :Mailing

    end
    
    factory :print_and_mail_work_order do
      association :project_type,  factory: :Print_and_mail

    end
    
    factory :other_project_work_order do
      association :project_type, factory: :OtherProject
    end
    
    factory :digital_print_work_order do
      association :project_type, factory: :DigitalPrint
    end
  end

  factory :base_work_order, class: WorkOrder do
    association :client
    dueDate 5.days.from_now
    association :project_type, factory: :OtherProject
  end
    
end

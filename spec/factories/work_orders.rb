FactoryGirl.define do
  factory :work_order do
    association :client
    dueDate 5.days.from_now
    association :status, factory: :status_active
    association :project_type, factory: :OtherProject
    
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
    association :client, factory: :client_seq
    sequence(:dueDate) { |n| n.days.from_now}
    association :project_type, factory: :OtherProject
    association :status,  factory: :status_active
      
      factory :completed_work_order do
        association :status, factory: :status_completed
      end
      
      factory :held_work_order do
        association :status, factory: :status_held
      end
      
      factory :due_today_work_order do
        dueDate Date.today
      end
  end
    
end

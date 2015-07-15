FactoryGirl.define do
  factory :processor, class: Role do
    name "processor"
  end
  factory :admin, class: Role do
    name "admin"
  end
  factory :manager, class: Role do
    name "manager"
  end
  factory :rep, class: Role do
    name "rep"
  end
  factory :accountant, class: Role do
    name "accountant"
  end
end

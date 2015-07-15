FactoryGirl.define do
  factory :user_processor, class: User do
    email "Test1@mailmarketingfla.com"
    password_digest "MyString"
    name "Jason"
    association :role, factory: :processor
  end
  factory :user_admin, class: User do
    email "Test2@mailmarketingfla.com"
    password_digest "MyString"
    name "root"
    association :role, factory: :admin
  end
  factory :user_manager, class: User do
    email "Test3@mailmarketingfla.com"
    password_digest "MyString"
    name "Kevin"
    association :role, factory: :manager
  end
  factory :user_rep, class: User do
    email "Test4@mailmarketingfla.com"
    password_digest "MyString"
    name "Dan"
    association :role, factory: :rep
  end
  factory :user_accountant, class: User do
    email "Test5@mailmarketingfla.com"
    password_digest "MyString"
    name "Robert"
    association :role, factory: :accountant
  end
end

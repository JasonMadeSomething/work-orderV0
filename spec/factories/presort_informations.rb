FactoryGirl.define do
  factory :presort_information do
    error_record_handling_id 1
    deduping_instructions_id 1
    suppression false
    dropship false
    association :work_order
  end

end

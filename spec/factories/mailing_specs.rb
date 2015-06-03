FactoryGirl.define do
    factory :letter_spec, class: MailingSpecs do
       height 4.5
       width 9.5
       sampleSize 10
       weightOfSample 12.96
    end
    
    factory :postcard_spec, class: MailingSpecs do
        height 6
        width 9
        sampleSize 10
        weightOfSample 12.96
    end
    
end
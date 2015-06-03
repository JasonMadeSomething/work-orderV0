FactoryGirl.define do
  factory :Mailing, class: ProjectType do
    name "Mailing, no digital print"
    mailing true
    printing false
  end

  factory :Print_and_mail, class: ProjectType do
    name "Mailing With digital print"
    mailing true
    printing true
  end
  
  factory :DigitalPrint, class: ProjectType do
    name "Digital Print only"
    mailing false
    printing true
  end
  
  factory :OtherProject, class: ProjectType do
    name "Other Project"
    mailing false
    printing false
  end
end

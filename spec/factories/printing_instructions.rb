FactoryGirl.define do
    factory :gloss_cover_2_up_no_variable_color_simplex, class: PrintingInstructions do
        paperStock "12x18 100lb Cover Gloss"
        nUp 2
        color  true
        duplex false
        variableData false
        association :work_order
    end
    factory :printing_instructons_base, class: PrintingInstructions do
        paperStock "8.5x11 20lb white"
        nUp 1
        color true
        duplex true
        variableData true
        association :work_order
    end
end
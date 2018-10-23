FactoryBot.define do
  sequence :reference do |n|
    "reference_#{n}"
  end

  factory :poem do
    fragment { 'This is a poem' }
    reference
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :district do
    name      "Uttar Dinajpur"
    state     {State.first || create(:geo_state)}
  end
end

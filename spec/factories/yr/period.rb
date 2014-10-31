FactoryGirl.define do
  factory :period, class: "Yr::Period" do
    id 0
    symbol
    precipitation 0
    temperature
    pressure

    skip_create
  end
end

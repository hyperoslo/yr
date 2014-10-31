FactoryGirl.define do
  factory :temperature, class: "Yr::Temperature" do
    unit "celcius"
    value 30

    skip_create
  end
end

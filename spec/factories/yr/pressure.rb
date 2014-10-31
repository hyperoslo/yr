FactoryGirl.define do
  factory :pressure, class: "Yr::Pressure" do
    unit "hPa"
    value 1022

    skip_create
  end
end

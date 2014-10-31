FactoryGirl.define do
  factory :symbol, class: "Yr::Symbol" do
    id "01d"
    number 4
    name "Sunny"

    skip_create
  end
end

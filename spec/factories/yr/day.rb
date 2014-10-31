FactoryGirl.define do
  factory :day, class: "Yr::Day" do
    name "Thursday"
    description "Foo"
    date Date.today
    periods []

    skip_create
  end
end

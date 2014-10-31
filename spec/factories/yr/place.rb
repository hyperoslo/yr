FactoryGirl.define do
  factory :place, class: "Yr::Place" do
    county "Oslo"
    municipality "Oslo"
    place "Oslo"

    skip_create
  end
end

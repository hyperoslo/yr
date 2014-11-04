FactoryGirl.define do
  factory :zip_code, class: "Yr::ZipCode" do
    zip_code "0461"

    skip_create
  end
end

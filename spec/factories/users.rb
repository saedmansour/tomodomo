FactoryGirl.define do
  factory :user do
    email			 						"email@email.com"
    password 							"pass1234"
    password_confirmation "pass1234"
  end
end
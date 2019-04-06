FactoryBot.define do
  factory :user do
    name { "MyString" }
    tel { "MyString" }
    email { "MyString@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    birth_year { "2019-04-02" }
  end
end

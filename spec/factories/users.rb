
FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'mo0000'}
    password_confirmation {password}
    first_name            {Gimei.first.kanji }
    last_name             {Gimei.last.kanji }
    first_name_katakana       {Gimei.first.katakana}
    last_name_katakana        {Gimei.last.katakana}
    birth_day                 {Faker::Date.backward }
  end

end
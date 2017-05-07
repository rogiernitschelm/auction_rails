Faker::Config.locale = :nl

FactoryGirl.define do
  sequence :email { |n| Faker::Internet.email(Faker::Internet.user_name + n.to_s) }
  sequence :user
  sequence :chamber_of_commerce { Array.new(8) { rand(10) }.join }
  sequence :expires_at do
    random = rand(10)

    Faker::Date.forward(random)
  end

  sequence :business do
    [
      'Agricultural',
      'Business services',
      'Communication',
      'Construction',
      'Cultural, sports and recreation',
      'Education',
      'Finance',
      'Goods rental',
      'Government',
      'Healthcare',
      'Hospitality',
      'Industry',
      'Mining',
      'Other',
      'Real estate',
      'Trade and commerce',
      'Trade',
      'Transport and storage',
      'Vehicles'
    ]
  end
end

FactoryGirl.define do

  # User-related

  factory :company do
    address Faker::Address.street_address
    business
    chamber_of_commerce
    city Faker::Address.city
    country Faker::Address.country
    email
    name Faker::Company.name
    telephone Faker::PhoneNumber.phone_number
  end

  factory :seller do
    verified true
    user
    company
  end

  factory :buyer do
    user
    company
  end

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email
    password 'abcd1234'
    admin false
  end

  factory :person, class: :user do
    city Faker::Address
  end

  # Auction related

  factory :auction do
    title Faker::Lorem.sentence(5, false, 5)
    description Faker::Lorem.paragraph
    starting_price 2
    buyout_price 3
    expires_at
    seller
  end

  factory :bid do
    amount Faker::Number.between(1, 99999)
    buyer
    auction
    placed_at Time.zone.now
  end
end

FactoryBot.define do

  factory(:organization) do
    sequence(:name) {|n| "Test Org #{n}" }
  end


end

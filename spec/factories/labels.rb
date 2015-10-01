FactoryGirl.define do
	factory :label do
		sequence(:name){ |n| "L#{n}"}
	end
end
Sham.email {|n| "#{n}@example.com" }

User.blueprint do
  email { Sham.email }
  password { "123456" }
end

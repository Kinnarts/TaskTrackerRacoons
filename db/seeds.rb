require 'faker'

User.create!(email: "go@further.always", password: "freedom123", admin: false)
User.create!(email: "admin_go@further.always", password: "freedom123", admin: true)

3.times do |n|
  Project.create!(name: Faker::Lorem.word, describe: Faker::Lorem.paragraph(2), owner_id: 2, tasks_attributes: [title: Faker::Lorem.words(2), describe: Faker::Lorem.paragraph(1), executor_id: 1, assigner_id: 2, _destroy: false, state: :created])
end
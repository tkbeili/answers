namespace :questions do
  desc "Generate a 100 random quetsions"
  task generate_questions: :environment do
    100.times do
      puts Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
    end
  end
end
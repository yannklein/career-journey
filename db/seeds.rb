User.destroy_all
Resource.destroy_all
Step.destroy_all

resource_type = {
  video: "📺",
  document: "📄",
  slides: "🎙",
  website: "💻",
  book: "📕",
  slack: "💬",
  other: "🧩"
}

steps_path = Rails.root.join('db/steps')
users_path = Rails.root.join('db/users')

puts "Steps/Resource creation"
step1 = Step.create(
  title: "CV and Linkedin",
  video: "G5GkCwIk6bk",
  description: File.open("#{steps_path}/step1.md").read,
  step_number: 1
)

Resource.create(
  res_type: resource_type[:slides],
  name: "Build your CV (slides)",
  description: "Best practices to build a CV adapted to your job search.",
  url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/FR5CCR0G5/cv_workshop.key?origin_team=T02NE0241&origin_channel=CV5L8RC3D",
  step: step1
)

Resource.create(
  res_type: resource_type[:slides],
  name: "Refine your LinkedIn (slides)",
  description: "A set of advice to make your LinkedIn profile attractive.",
  url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/FQXE4CKNV/linkedin_workshop.pptx?origin_team=T02NE0241&origin_channel=CV5L8RC3D",
  step: step1
)

Resource.create(
  res_type: resource_type[:website],
  name: "Career Playbook",
  description: "The official career playbook of Le Wagon, giving numerous tips to boost your career journey.",
  url: "https://github.com/lewagon/career",
  step: step1
)

step2 = Step.create(
  title: "Github and portfolio preparation",
  video: nil,
  description: File.open("#{steps_path}/step2.md").read,
  step_number: 2
)

Resource.create(res_type: resource_type[:slides], name: "Pimp your Github (slides)",description: "A tutorial to improve your github account.",url: "https://lewagon-alumni.slack.com/files/UFN01H4F7/F018XU1A7M3/pimp_my_github_2020_08_17.pdf",step: step2)

Resource.create(res_type: resource_type[:website], name: "Ankita Satija's page",description: "A killer example of portfolio page.",url: "https://www.ankitasatija.com/let-s-dutch",step: step2)
Resource.create(res_type: resource_type[:website], name: "Thalida's page",description: "A killer example of portfolio page.",url: "https://thalida.me/x/meta-timeline/2018-01--2018-08?t=2018-06-09T20:40:00",step: step2)
Resource.create(res_type: resource_type[:website], name: "Grace Yang's page",description: "A killer example of portfolio page.",url: "https://www.thegraceyang.com/",step: step2)
Resource.create(res_type: resource_type[:website], name: "Design inspiration" ,description: "Unrealisticly good portfolios for inspiration.",url: "https://humans.fyi/",step: step2)

Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Laura's portfolio", step: step2, url: "https://www.spamforbreakfast.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Maria (teacher)'s portfolio", step: step2, url: "http://mariacodes.io/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Jordan's portfolio", step: step2, url: "https://jluong.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Kingsley's portfolio", step: step2, url: "https://www.kingsleylau.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Pao's portfolio", step: step2, url: "https://www.paphada-e.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Paulo's portfolio", step: step2, url: "https://www.paulodalberti.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Paul's portfolio", step: step2, url: "http://www.pauloovallerivera.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Doug 's portfolio", step: step2, url: "http://www.douglasberkley.com/")
Resource.create(res_type: resource_type[:website], description: "A portfolio example", name: "Yann's portfolio", step: step2, url: " https://www.yannklein.me")

step3 = Step.create(
  title: "Build your portfolio",
  video: "",
  description: File.open("#{steps_path}/step3.md").read,
  step_number: 3
)

step4 = Step.create(
  title: "Landing your first job",
  video: "AIfAc0i_v6I",
  description: File.open("#{steps_path}/step4.md").read,
  step_number: 4
)

step5 = Step.create(
  title: "Tech interview & coding after Le Wagon",
  video: "https://www.youtube.com/watch?v=ZAw1F5wDyko",
  description: File.open("#{steps_path}/step5.md").read,
  step_number: 5
)

# puts "Admin creation"
User.create(email: "yann.klein@me.com", step: step1, name: "Yann Klein", batch: 465, github_account: "yannklein", password: ENV['YANN_PWD'], admin: true, completed: true)
User.create(email: "douglas.berkley@lewagon.org", step: step1, name: "Doug Berkley", batch: 471, github_account: "dmbf29", password: ENV['DOUG_PWD'], admin: true, completed: true)

# puts "User creation"
# serialized_users = File.read("#{users_path}/students.json")
# users = JSON.parse(serialized_users)

# users.each do |user|
#   # p user['batch']
#   User.create!(
#     email: user['email'],
#     step: step1,
#     name: "#{user['first_name']} #{user['last_name']}",
#     batch: user['batch']["number"],
#     github_account: user["github"],
#     password: "lewag00n")
# end
# puts "#{User.count} users created"

puts "Seed done!"

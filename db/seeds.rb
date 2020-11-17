User.destroy_all
Resource.destroy_all
Step.destroy_all

resource_type = {
  video: "📺",
  article: "✍️",
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

Resource.create(res_type: resource_type[:slides], description: "Your first job (slides)", name: "Tips and advises to prepare your first job landing.", step: step4, url: "https://lewagon-alumni.slack.com/files/U3NU6FH7C/FV8QM9M50/lw_tokyo_-_landing_a_job.pdf?origin_team=T02NE0241&origin_channel=CV5L8RC3D")
Resource.create(res_type: resource_type[:video], description: "Your first job (slides)", name: "Tips and advises to prepare your first job landing.", step: step4, url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/F019NEQ6X7Y/computer_futures.mp4")

Resource.create(res_type: resource_type[:article], step: step4, name: "First job as a dev" , description: "Article by Paulo D'Alberti that TAed with you", url: "https://medium.com/@phdalberti/landing-your-first-job-as-a-dev-in-tokyo-after-le-wagon-1692909e6678")
Resource.create(res_type: resource_type[:article], step: step4, name: "How to find web dev jobs in Tokyo" , description: "Article by Sylvain", url: "https://medium.com/le-wagon/how-to-find-your-first-web-developer-job-in-tokyo-4b565f0aeac3")
Resource.create(res_type: resource_type[:article], step: step4, name: "Myths and reality of working in Tokyo as a dev" , description: "Article by Rob Sherling (freelancer in Japan)", url: "https://dev.to/rob117/working-in-japan-myths-realities-compensation-culture-by-a-software-engineer-2lh")

step5 = Step.create(
  title: "Tech interview & coding after Le Wagon",
  video: "ZAw1F5wDyko",
  description: File.open("#{steps_path}/step5.md").read,
  step_number: 5
)

Resource.create(res_type: resource_type[:slides], name: "Technical Interview (slides)", description: "How to prepare for the technical interview", step: step5, url: "https://lewagon-alumni.slack.com/files/UFN01H4F7/F019C84MHDZ/technical_interviews.pdf")
Resource.create(res_type: resource_type[:slides], name: "What to learn after LW", description: "The ultimate guide for your post-LW life", step: step5, url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/FRAV93EQ6/what_to_learn_after_le_wagon.pdf?origin_team=T02NE0241&origin_channel=CV5L8RC3D")
Resource.create(res_type: resource_type[:book], name: "Cracking the Coding Interview", description: "The reference for dev tech interviews", step: step5, url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/F0198C3JVDG/cracking_the_coding_interview.pdf")
Resource.create(res_type: resource_type[:other], name: "What to learn after LW", description: "The ultimate guide for your post-LW life", step: step5, url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/FR8P4J5GQ/technical_interview_resources.pdf")
Resource.create(res_type: resource_type[:video], name: "How to nail your hiring interview?", description: "Talk with Le Wagon alumni", step: step5, url: "https://www.youtube.com/watch?v=NDAYZFB2viQ")

step6 = Step.create(
  title: "Intro to Freelancing",
  video: "y_VYKu5xB1o",
  description: File.open("#{steps_path}/step6.md").read,
  step_number: 6
)

Resource.create(res_type: resource_type[:other], name: "Career Playbook: Freelancing", description: "The LW Carer playbook about Freelancing", step: step6, url: "https://github.com/lewagon/career/blob/master/articles/freelancer.md")

step7 = Step.create(
  title: "Intro to React",
  video: "Fq1cSWPUvn4",
  description: File.open("#{steps_path}/step7.md").read,
  step_number: 7
)

Resource.create(res_type: resource_type[:video], name: "React preparation video", description: "A video to link what you learn during the bootcamp and the LW React track", step: step7, url: "https://kitt.lewagon.com/knowledge/tracks/react-redux?path=01-React%2F01-Tooling&section=lecture")
Resource.create(res_type: resource_type[:website], name: "React boilerplate", description: "Boilerplate to kickstart your code", step: step7, url: "https://github.com/yannklein/react-workshop")


# puts "Admin creation"
User.create(email: "yann.klein@me.com", step: step1, name: "Yann Klein", batch: 465, github_account: "yannklein", password: ENV['ADMIN_PWD'], admin: true, completed: true)
User.create(email: "douglas.berkley@lewagon.org", step: step1, name: "Doug Berkley", batch: 471, github_account: "dmbf29", password: ENV['ADMIN_PWD'], admin: true, completed: true)
User.create(email: "sylvain.pierre@lewagon.org", step: step1, name: "Sylvain Pierre", batch: 471, github_account: "SylvainPierre", password: ENV['ADMIN_PWD'], admin: true, completed: true)
User.create(email: "sasha.kaverina@lewagon.org", step: step1, name: "Sasha Kaverina", batch: 471, github_account: "sashakaverina", password: ENV['ADMIN_PWD'], admin: true, completed: true)
User.create(email: "trouni@gmail.com", step: step1, name: "Trouni Tiet", batch: 252, github_account: "trouni", password: ENV['ADMIN_PWD'], admin: true, completed: true)

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

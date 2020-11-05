User.destroy_all
Resource.destroy_all
Step.destroy_all

resource_type = {
  video: "video",
  document: "document",
  website: "website",
  book: "book",
  slack: "slack",
  other: "other"
}

steps_path = Rails.root.join('db/steps')

puts "Steps/Resource creation"
step1 = Step.create(
  title: "CV and Linkedin",
  video: "https://youtu.be/G5GkCwIk6bk",
  description: File.open("#{steps_path}/step1.md").read,
  step_number: 1
)

Resource.create(
  res_type: resource_type[:document],
  name: "Build your CV",
  description: "Best practices to build a CV adapted to your job search.",
  url: "https://lewagon-alumni.slack.com/files/U4APKLFLM/FR5CCR0G5/cv_workshop.key?origin_team=T02NE0241&origin_channel=CV5L8RC3D",
  step: step1
)

Resource.create(
  res_type: resource_type[:document],
  name: "Refine your LinkedIn",
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
  title: "Portfolio",
  video: nil,
  description: File.open("#{steps_path}/step2.md").read,
  step_number: 2
)

Resource.create(
  res_type: resource_type[:website],
  name: "Ankita Satija's page",
  description: "A killer example of portfolio page.",
  url: "https://www.ankitasatija.com/let-s-dutch",
  step: step2
)

Resource.create(
  res_type: resource_type[:website],
  name: "Thalida's page",
  description: "A killer example of portfolio page.",
  url: "https://thalida.me/x/meta-timeline/2018-01--2018-08?t=2018-06-09T20:40:00",
  step: step2
)

Resource.create(
  res_type: resource_type[:website],
  name: "Grace Yang's page",
  description: "A killer example of portfolio page.",
  url: "https://www.thegraceyang.com/",
  step: step2
)

step3 = Step.create(
  title: "Landing your first job",
  video: "https://youtu.be/AIfAc0i_v6I",
  description: File.open("#{steps_path}/step3.md").read,
  step_number: 3
)

step4 = Step.create(
  title: "Tech interview & coding after Le Wagon",
  video: "https://www.youtube.com/watch?v=ZAw1F5wDyko",
  description: File.open("#{steps_path}/step4.md").read,
  step_number: 4
)

puts "User creation"
User.create(email: "yann.klein@me.com", step: step1, name: "Yann Klein", batch: 666, github_account: "yannklein", password: "123456")

puts "Seed done!"

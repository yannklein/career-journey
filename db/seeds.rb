# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

puts "Steps/Resource creation"
step1 = Step.create(
  title: "CV and Linkedin",
  description:
    "As discussed, today is the first pre-Demo day Career Week challenge!
    The objectives ☕️
    - Build your CV - follow the slides for best practices 💅
    - Refine your LinkedIn - follow the slides to get the best reach 💼
    - Read the Career Playbook
    - Post your LinkedIn profile on the batch Slack channel, add your classmates and go to their profile to endorse them - you guys are more than qualified to be endorsed in Ruby on Rails, Git, JavaScript, HTML/CSS, etc..  it only takes 3-5 clicks and will add more legitimacy to your profile as a developer.
    Write some recommendations for your classmates too! You can ask someone to recommend you, but make sure you write one back if someone writes one for you.",
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
  description:
    "Today, we focus on building your portfolio!
      Here are the main steps:
      - Assemble a list of all of the social links you want to link on your portfolio site: your Github (pimp it with our tuto 👇), Medium, LinkedIn, Instagram, etc.
      - Pick a domain name for your site and purchase it. Useful tips: use a .com, .me, .tech, or a .io domain. Do not use .co as it often gets flagged as spam
      - Fork 🍴 your Final projects, your Airbnb projects, Mr. Cocktail, any others and clean up the front end.
      - Take a screenshot of your products’ landing page.
      - Do a one paragraph write-up describing the challenges and solutions of the project. This can be as simple as the product card on the Kitt products page
      For bonus points: Take a video of your journey to upload to your site (this will be useful to share with potential clients too!)",
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

step2 = Step.create(
  title: "Landing your first job",
  description:
    "Today, we focus on building your portfolio!
      Here are the main steps:
      - Assemble a list of all of the social links you want to link on your portfolio site: your Github (pimp it with our tuto 👇), Medium, LinkedIn, Instagram, etc.
      - Pick a domain name for your site and purchase it. Useful tips: use a .com, .me, .tech, or a .io domain. Do not use .co as it often gets flagged as spam
      - Fork 🍴 your Final projects, your Airbnb projects, Mr. Cocktail, any others and clean up the front end.
      - Take a screenshot of your products’ landing page.
      - Do a one paragraph write-up describing the challenges and solutions of the project. This can be as simple as the product card on the Kitt products page
      For bonus points: Take a video of your journey to upload to your site (this will be useful to share with potential clients too!)",
  step_number: 3
)

step3 = Step.create(
  title: "Tech interview & coding after Le Wagon",
  description:
    "Today, we focus on building your portfolio!
      Here are the main steps:
      - Assemble a list of all of the social links you want to link on your portfolio site: your Github (pimp it with our tuto 👇), Medium, LinkedIn, Instagram, etc.
      - Pick a domain name for your site and purchase it. Useful tips: use a .com, .me, .tech, or a .io domain. Do not use .co as it often gets flagged as spam
      - Fork 🍴 your Final projects, your Airbnb projects, Mr. Cocktail, any others and clean up the front end.
      - Take a screenshot of your products’ landing page.
      - Do a one paragraph write-up describing the challenges and solutions of the project. This can be as simple as the product card on the Kitt products page
      For bonus points: Take a video of your journey to upload to your site (this will be useful to share with potential clients too!)",
  step_number: 3
)

puts "User creation"
User.create(email: "yann.klein@me.com", step: step1, name: "Yann Klein", batch: 666, github_account: "yannklein", password: "123456")

puts "Seed done!"

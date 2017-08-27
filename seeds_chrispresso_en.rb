
#ActiveRecord::Migration.add_column :organizations, :member_no, :string, null: true, limut: 100

# rake db:drop && rm -rf tmp/cache_* && rake db:create && rake db:migrate && rake db:seed && rails r seeds_chrispresso.rb

Setting.set('import_mode', true)
Setting.set('system_init_done', true)

UserInfo.current_user_id = 1
group1 = Group.create_or_update(
  id: 1,
  name: 'Sales',
  active: true,
)
group2 = Group.create_or_update(
  name: '2nd Level',
  active: true,
)
group3 = Group.create_or_update(
  name: 'Service Desk',
  active: true,
)
org1 = Organization.create_or_update(
  name: 'Chrispresso Inc.',
  note: 'Manufacturer of individual coffee products.',
)
org2 = Organization.create_or_update(
  name: 'Awesome Customer Inc.',
  note: 'Global distributor of communication and security products, electrical and electronic wire & cable.',
)
org3 = Organization.create_or_update(
  name: 'Good Customer Inc.',
  note: 'Search the world\'s information, including webpages, images, videos and more. Good Customer has many special features to help you find exactly what you\'re looking for.',
)

roles = Role.where(name: ['Agent', 'Admin'])
groups = Group.all
agent1 = User.create_or_update(
  login: 'chris@chrispresso.com',
  firstname: 'Christopher',
  lastname: 'Miller',
  email: 'chris@chrispresso.com',
  password: 'chris4711',
  active: true,
  roles: roles,
  groups: groups,
  organization_id: org1.id,
)
file = File.open('demo-chrispresso/images/chris.jpg', 'rb')
contents = file.read
avatar1 = Avatar.add(
  object: 'User',
  o_id: agent1.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', agent1.id, avatar1.id)
agent1.update_attributes(image: avatar1.store_hash)

agent2 = User.create_or_update(
  login: 'jacob@chrispresso.com',
  firstname: 'Jacob',
  lastname: 'Smith',
  email: 'jacob@chrispresso.com',
  password: 'chris4711',
  active: true,
  roles: roles,
  groups: groups,
  organization_id: org1.id,
)
file = File.open('demo-chrispresso/images/jacob.jpg', 'rb')
contents = file.read
avatar2 = Avatar.add(
  object: 'User',
  o_id: agent2.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', agent2.id, avatar2.id)
agent2.update_attributes(image: avatar2.store_hash)

roles = Role.where(name: ['Agent'])
agent3 = User.create_or_update(
  login: 'emma@chrispresso.com',
  firstname: 'Emma',
  lastname: 'Taylor',
  email: 'emma@chrispresso.com',
  password: 'chris4711',
  active: true,
  roles: roles,
  groups: groups,
  organization_id: org1.id,
)
file = File.open('demo-chrispresso/images/emma.jpg', 'rb')
contents = file.read
avatar3 = Avatar.add(
  object: 'User',
  o_id: agent3.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', agent3.id, avatar3.id)
agent3.update_attributes(image: avatar3.store_hash)

roles = Role.where(name: 'Customer')

customer1 = User.create_or_update(
  login: 'anna@example.com',
  firstname: 'Anna',
  lastname: 'Lopez',
  email: 'anna@example.com',
  password: 'chris4711',
  address: "Golden Gate Bridge\nSan Francisco, CA 94129",
  phone: '415-123-5858',
  active: true,
  roles: roles,
  organization_id: org2.id,
  note: 'likes espresso romano - recommended espresso con panna',
)
file = File.open('demo-chrispresso/images/anna.jpg', 'rb')
contents = file.read
avatar1 = Avatar.add(
  object: 'User',
  o_id: customer1.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', customer1.id, avatar1.id)
customer1.update_attributes(image: avatar1.store_hash)

customer2 = User.create_or_update(
  login: 'samuel@example.com',
  firstname: 'Samuel',
  lastname: 'Lee',
  email: 'samuel@example.com',
  password: 'chris4711',
  address: "5201 Blue Lagoon Drive\n8th Floor & 9th Floor\nMiami, FL 33126",
  phone: '855-666-7777',
  active: true,
  roles: roles,
  organization_id: org2.id,
  note: 'likes americano, did order two units'
)
file = File.open('demo-chrispresso/images/samuel.jpg', 'rb')
contents = file.read
avatar2 = Avatar.add(
  object: 'User',
  o_id: customer2.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', customer2.id, avatar2.id)
customer2.update_attributes(image: avatar2.store_hash)

customer3 = User.create_or_update(
  login: 'emily@example.com',
  firstname: 'Emily',
  lastname: 'Adams',
  email: 'emily@example.com',
  password: 'chris4711',
  address: "Bennelong Point\nSydney NSW 2000",
  phone: '0061 2 1234 7777',
  active: true,
  roles: roles,
  organization_id: org2.id,
  note: 'did order café au lait, ask next time if the flavor was as expected'
)
file = File.open('demo-chrispresso/images/emily.jpg', 'rb')
contents = file.read
avatar3 = Avatar.add(
  object: 'User',
  o_id: customer3.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', customer3.id, avatar3.id)
customer3.update_attributes(image: avatar3.store_hash)

customer4 = User.create_or_update(
  login: 'ryan@example.com',
  firstname: 'Ryan',
  lastname: 'Parker',
  email: 'ryan@example.com',
  password: 'chris4711',
  address: "Brandenburger Tor 7\n10117 Berlin",
  phone: '0049 30 1234 5678',
  active: true,
  roles: roles,
  organization_id: org3.id,
  note: 'no latte but macchiato'
)
file = File.open('demo-chrispresso/images/ryan.jpg', 'rb')
contents = file.read
avatar4 = Avatar.add(
  object: 'User',
  o_id: customer4.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', customer4.id, avatar4.id)
customer4.update_attributes(image: avatar4.store_hash)

customer5 = User.create_or_update(
  login: 'david@example.com',
  firstname: 'David',
  lastname: 'Bell',
  email: 'david@example.com',
  password: 'chris4711',
  address: "Eiffel Tower\n5 Avenue Anatole France\n75007 Paris",
  phone: '0033 892 12 34 56',
  active: true,
  roles: roles,
  note: 'did order viennese melange, ask next time if the flavor was as expected'
)
file = File.open('demo-chrispresso/images/david.jpg', 'rb')
contents = file.read
avatar5 = Avatar.add(
  object: 'User',
  o_id: customer5.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', customer5.id, avatar5.id)
customer5.update_attributes(image: avatar5.store_hash)

customer6 = User.create_or_update(
  login: 'olivia@example.com',
  firstname: 'Olivia',
  lastname: 'Ross',
  email: 'olivia@example.com',
  password: 'chris4711',
  address: "Westminster\nLondon SW1A 0AA",
  phone: '0044 20 1234 5678',
  active: true,
  roles: roles,
)
file = File.open('demo-chrispresso/images/olivia.jpg', 'rb')
contents = file.read
avatar6 = Avatar.add(
  object: 'User',
  o_id: customer6.id,
  default: true,
  resize: {
    content: contents,
    mime_type: 'image/jpg',
  },
  source: 'web',
  deletable: true,
  updated_by_id: 1,
  created_by_id: 1,
)
Avatar.set_default('User', customer6.id, avatar6.id)
customer6.update_attributes(image: avatar6.store_hash)


# order#1
UserInfo.current_user_id = customer1.id
created_at = Time.zone.now - 6.months - 2.hours
ticket1 = Ticket.create(
  #number: 10001,
  title: 'Order 777555',
  group: group1,
  customer: customer1,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'closed'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket1.tag_add('order')
ticket1.tag_add('viennese melange')
article = Ticket::Article.create(
  ticket: ticket1,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer1.fullname} <#{customer1.email}>",
  to: 'order@chrispresso.com',
  body: "Hi Chris,

thanks for your recommendation, I want to order 2 more units of the viennese melange.

#{customer1.fullname}",
  content_type: 'text/plain',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = agent1.id
created_at = Time.zone.now - 6.months - 1.hours
article = Ticket::Article.create(
  ticket: ticket1,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Agent'),
  from: "#{agent1.fullname} via <order@chrispresso.com>",
  to: "#{customer1.fullname} <#{customer1.email}>",
  body: "Hi #{customer1.firstname},<br/>
<br/>
nice, we will ship it to your delivery address:<br/>
<br/>
#{customer1.address}.<br/>
<br/>
You will get it on Tuesday.<br/>
<span class='js-signatureMarker'></span>
<br/>
--<br/>
Greetings,<br/>
<br/>
#{agent1.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = customer1.id
created_at = Time.zone.now - 6.months + 1.day + 5.hours
article = Ticket::Article.create(
  ticket: ticket1,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer1.fullname} <#{customer1.email}>",
  to: 'order@chrispresso.com',
  body: "Hi Chris,<br/>
<br/>
it's delicious!
<br/>
--<br/>
<span class='js-signatureMarker'></span>
Greetings,<br/>
<br/>
#{customer1.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# order#2
UserInfo.current_user_id = customer2.id
created_at = Time.zone.now - 5.months - 2.days
ticket2 = Ticket.create(
  #number: 10001,
  title: 'Order 787556',
  group: group1,
  customer: customer2,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'closed'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket2.tag_add('order')
ticket2.tag_add('americano')
article = Ticket::Article.create(
  ticket: ticket2,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer2.fullname} <#{customer2.email}>",
  to: 'order@chrispresso.com',
  body: "Dear Chrispresso Team,<br/>
<br/>
<u>Order:</u><br/>
2 x Café Americano<br/>
1 x Café Cubano<br/>
3 x Ca phe sua da<br/>
<br/>
<u>Delivery Address:</u><br/>
Samuel Lee<br/>
5201 Blue Lagoon Drive<br/>
8th Floor & 9th Floor<br/>
Miami, FL 33126<br/>
<span class='js-signatureMarker'></span>
<br/>
#{customer2.fullname}",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = agent2.id
created_at = Time.zone.now - 5.months - 2.hours
article = Ticket::Article.create(
  ticket: ticket2,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Agent'),
  from: "#{agent2.fullname} via <order@chrispresso.com>",
  to: "#{customer2.fullname} <#{customer2.email}>",
  body: "Hi #{customer2.firstname},<br/>
<br/>
nice, we will ship it to your delivery address:<br/>
<br/>
#{customer2.address}.<br/>
<br/>
You will get it on Monday.<br/>
Enjoy!<br/>
<span class='js-signatureMarker'></span>
<br/>
--<br/>
Greetings,<br/>
<br/>
#{agent2.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# order#3
UserInfo.current_user_id = customer4.id
created_at = Time.zone.now - 4.months - 1.day
ticket3 = Ticket.create(
  #number: 10001,
  title: 'Order 787956',
  group: group1,
  customer: customer4,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'closed'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket3.tag_add('order')
ticket3.tag_add('americano')
article = Ticket::Article.create(
  ticket: ticket3,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer4.fullname} <#{customer4.email}>",
  to: 'order@chrispresso.com',
  body: "Hi,<br/>
<br/>
<u>my order is:</u><br/>
10 x Café Americano<br/>
1 x Café Cubano<br/>
<br/>
<u>Delivery Address:</u><br/>
Samuel Lee<br/>
Mr. Ryan Parker<br/>
Brandenburger Tor 7<br/>
10117 Berlin<br/>
<span class='js-signatureMarker'></span>
<br/>
#{customer4.fullname}",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = agent3.id
created_at = Time.zone.now - 4.months - 2.hours
article = Ticket::Article.create(
  ticket: ticket3,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Agent'),
  from: "#{agent3.fullname} via <order@chrispresso.com>",
  to: "#{customer4.fullname} <#{customer4.email}>",
  body: "Hi #{customer4.firstname},<br/>
<br/>
nice, we will ship it to your delivery address:<br/>
<br/>
#{customer4.address}.<br/>
<br/>
You will get it till Wednesday.<br/>
See you!<br/>
<span class='js-signatureMarker'></span>
<br/>
--<br/>
Greetings,<br/>
<br/>
#{agent3.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# order#4
UserInfo.current_user_id = customer5.id
created_at = Time.zone.now - 3.months - 1.day
ticket4 = Ticket.create(
  #number: 10001,
  title: 'Order 887956',
  group: group1,
  customer: customer5,
  owner_id: agent3.id,
  state: Ticket::State.find_by(name: 'pending reminder'),
  pending_time: Time.zone.now + 1.month,
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket4.tag_add('order')
ticket4.tag_add('kopi susu')
article = Ticket::Article.create(
  ticket: ticket4,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer5.fullname} <#{customer5.email}>",
  to: 'order@chrispresso.com',
  body: "Hi,<br/>
<br/>
<u>please send me:</u><br/>
1 x Café Kopi susu<br/>
4 x Viennese melange<br/>
<br/>
<u>Delivery Address:</u><br/>
#{customer5.fullname}<br/>
Eiffel Tower<br/>
5 Avenue Anatole France<br/>
75007 Paris<br/>
<span class='js-signatureMarker'></span>
<br/>
#{customer5.fullname}",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = agent3.id
created_at = Time.zone.now - 3.months - 2.hours
article = Ticket::Article.create(
  ticket: ticket4,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Agent'),
  from: "#{agent3.fullname} via <order@chrispresso.com>",
  to: "#{customer5.fullname} <#{customer5.email}>",
  body: "Hi #{customer5.firstname},<br/>
<br/>
nice, we will ship it to your delivery address:<br/>
<br/>
#{customer5.address}.<br/>
<br/>
You will get it till Wednesday.<br/>
<span class='js-signatureMarker'></span>
<br/>
--<br/>
Greetings,<br/>
<br/>
#{agent3.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# complaint#1
UserInfo.current_user_id = customer5.id
created_at = Time.zone.now - 2.months - 1.day
ticket5 = Ticket.create(
  #number: 10001,
  title: 'complaint wrong delivery of order #51519891',
  group: group1,
  customer: customer5,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'closed'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket5.tag_add('complaint')
ticket5.tag_add('wrong delivery')
article = Ticket::Article.create(
  ticket: ticket5,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer5.fullname} <#{customer5.email}>",
  to: 'order@chrispresso.com',
  body: "Hi,<br/>
<br/>
some complaint",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = agent3.id
created_at = Time.zone.now - 2.months - 2.hours
article = Ticket::Article.create(
  ticket: ticket5,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Agent'),
  from: "#{agent3.fullname} via <order@chrispresso.com>",
  to: "#{customer5.fullname} <#{customer5.email}>",
  body: "Hi #{customer5.firstname},<br/>
<br/>
some reply<br/>
<span class='js-signatureMarker'></span>
<br/>
--<br/>
Greetings,<br/>
<br/>
#{agent3.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# complaint#2
UserInfo.current_user_id = customer1.id
created_at = Time.zone.now - 2.months - 1.day
ticket6 = Ticket.create(
  #number: 10001,
  title: 'complaint wrong items in order #55194711',
  group: group1,
  customer: customer1,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'closed'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket6.tag_add('complaint')
ticket6.tag_add('wrong delivery')
article = Ticket::Article.create(
  ticket: ticket6,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer1.fullname} <#{customer1.email}>",
  to: 'order@chrispresso.com',
  body: "Hi,<br/>
<br/>
some complaint",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = agent1.id
created_at = Time.zone.now - 2.months - 2.hours
article = Ticket::Article.create(
  ticket: ticket6,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Agent'),
  from: "#{agent1.fullname} via <order@chrispresso.com>",
  to: "#{customer1.fullname} <#{customer1.email}>",
  body: "Hi #{customer1.firstname},<br/>
<br/>
some reply<br/>
<span class='js-signatureMarker'></span>
<br/>
--<br/>
Greetings,<br/>
<br/>
#{agent1.fullname}<br/>",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# feedback with image#1
UserInfo.current_user_id = customer3.id
created_at = Time.zone.now - 1.day
ticket7 = Ticket.create(
  #number: 10001,
  title: 'Thanks! Great service!',
  group: group1,
  customer: customer3,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'open'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
ticket7.tag_add('feedback')
ticket7.tag_add('positive')
file = File.open('demo-chrispresso/images/flat_white_coffee.png', 'rb')
contents = Base64.encode64(file.read)
article = Ticket::Article.create(
  ticket: ticket7,
  type: Ticket::Article::Type.find_by(name: 'email'),
  sender: Ticket::Article::Sender.find_by(name: 'Customer'),
  from: "#{customer3.fullname} <#{customer3.email}>",
  to: 'service@chrispresso.com',
  body: "Dear Team,<br/>
<br/>
I really love ❤️ your Flat white!<br/>
<br/>
<img width=\"280\" height=\"240\" src=\"data:image/png;base64,#{contents}\">
<br/>
Enjoy!<br/>
<br/>
-#{customer3.firstname}",
  content_type: 'text/html',
  internal: false,
  created_at: created_at,
  updated_at: created_at,
)

# ticket#8 - little conversation 3 people + internal note

# + emoji
# feedback with image#1
UserInfo.current_user_id = customer5.id
created_at = Time.zone.now - 9.hours
ticket8 = Ticket.create(
  #number: 10001,
  title: 'Need more information!',
  group: group1,
  customer: customer5,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'open'),
  priority: Ticket::Priority.find_by(name: '3 high'),
  created_at: created_at,
  updated_at: created_at,
)

UserInfo.current_user_id = customer6.id
created_at = Time.zone.now - 9.hours
ticket8 = Ticket.create(
  #number: 10001,
  title: 'Heads up 🕹!',
  group: group1,
  customer: customer6,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'open'),
  priority: Ticket::Priority.find_by(name: '3 high'),
  created_at: created_at,
  updated_at: created_at,
)

UserInfo.current_user_id = customer1.id
created_at = Time.zone.now - 9.hours
ticket8 = Ticket.create(
  #number: 10001,
  title: 'Surprise - well done',
  group: group1,
  customer: customer1,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'new'),
  priority: Ticket::Priority.find_by(name: '3 high'),
  created_at: created_at,
  updated_at: created_at,
)

UserInfo.current_user_id = customer2.id
created_at = Time.zone.now - 6.hours
ticket8 = Ticket.create(
  #number: 10001,
  title: 'Error 4711 ⛑',
  group: group1,
  customer: customer2,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'new'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)
UserInfo.current_user_id = customer4.id
created_at = Time.zone.now - 3.hours
ticket8 = Ticket.create(
  #number: 10001,
  title: 'Need some water',
  group: group1,
  customer: customer4,
  owner_id: 1,
  state: Ticket::State.find_by(name: 'new'),
  priority: Ticket::Priority.find_by(name: '2 normal'),
  created_at: created_at,
  updated_at: created_at,
)


# 2 individual overviews with 8-10 tickets in there
UserInfo.current_user_id = 1
overview_role = Role.find_by(name: 'Agent')
Overview.create_if_not_exists(
  name: 'Open Banana Items',
  link: 'banana',
  prio: 1000,
  role_ids: [overview_role.id],
  condition: {
    'ticket.state_id' => {
      operator: 'is',
      value: [1, 2, 3, 4, 5],
    },
  },
  order: {
    by: 'created_at',
    direction: 'ASC',
  },
  view: {
    d: %w(title customer group created_at),
    s: %w(title customer group created_at),
    m: %w(number title customer group created_at),
    view_mode_default: 's',
  },
)

Overview.create_if_not_exists(
  name: 'VIP Customers',
  link: 'vip',
  prio: 1000,
  role_ids: [overview_role.id],
  condition: {
    'ticket.state_id' => {
      operator: 'is',
      value: [ 1 ],
    },
  },
  order: {
    by: 'created_at',
    direction: 'ASC',
  },
  view: {
    d: %w(title customer group created_at),
    s: %w(title customer group created_at),
    m: %w(number title customer group created_at),
    view_mode_default: 's',
  },
)

# TextModule.load
TextModule.load('en-us')

# Calender.init_setup('1.1.1.1') # de
# Calender.init_setup('1.1.1.1') # us
Calendar.init_setup('208.113.83.165')

# Add Macros
Macro.create_if_not_exists(
  name: 'Move to RMA',
  perform: {
    'ticket.state_id' => {
      value: Ticket::State.find_by(name: 'closed').id,
    },
    'ticket.tags' => {
      operator: 'add',
      value: 'spam',
    },
    'ticket.owner_id' => {
      pre_condition: 'current_user.id',
      value: '',
    },
  },
  note: 'example macro',
  active: true,
)
Macro.create_if_not_exists(
  name: 'Reply & Close & Tag as Banana',
  perform: {
    'ticket.state_id' => {
      value: Ticket::State.find_by(name: 'closed').id,
    },
    'ticket.tags' => {
      operator: 'add',
      value: 'spam',
    },
    'ticket.owner_id' => {
      pre_condition: 'current_user.id',
      value: '',
    },
  },
  note: 'example macro',
  active: true,
)

# online notifications
# disable cleanup jobs
Scheduler.create_if_not_exists(
  name: 'Delete old entries.',
  active: false,
)
Scheduler.create_or_update(
  name: 'Delete old online notification entries.',
  active: false,
)

UserInfo.current_user_id = nil
OnlineNotification.create!([
  {o_id: ticket1.id, object_lookup_id: ObjectLookup.by_name('Ticket'), type_lookup_id: TypeLookup.by_name('create'), user_id: agent1.id, seen: true, updated_by_id: agent3.id, created_by_id: agent3.id, created_at: Time.zone.now - 90.minutes},
  {o_id: ticket2.id, object_lookup_id: ObjectLookup.by_name('Ticket'), type_lookup_id: TypeLookup.by_name('create'), user_id: agent1.id, seen: true, updated_by_id: customer1.id, created_by_id: customer1.id, created_at: Time.zone.now - 30.minutes},
  {o_id: ticket7.id, object_lookup_id: ObjectLookup.by_name('Ticket'), type_lookup_id: TypeLookup.by_name('update'), user_id: agent1.id, seen: false, updated_by_id: agent2.id, created_by_id: agent2.id, created_at: Time.zone.now - 5.minutes},
  {o_id: ticket5.id, object_lookup_id: ObjectLookup.by_name('Ticket'), type_lookup_id: TypeLookup.by_name('create'), user_id: agent1.id, seen: false, updated_by_id: customer3.id, created_by_id: customer3.id, created_at: Time.zone.now},
])



# activity stream
Scheduler.create_if_not_exists(
  name: 'Delete old activity stream entries.',
  active: false,
)
ActivityStream.create!([
  { activity_stream_type_id: TypeLookup.by_name('create'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket1.id, created_by_id: agent2.id, created_at: Time.zone.now - 4.hours},
  { activity_stream_type_id: TypeLookup.by_name('create'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket2.id, created_by_id: customer2.id, created_at: Time.zone.now - 3.hours},
  { activity_stream_type_id: TypeLookup.by_name('create'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket3.id, created_by_id: customer3.id, created_at: Time.zone.now - 2.hours},
  { activity_stream_type_id: TypeLookup.by_name('update'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket1.id, created_by_id: agent1.id, created_at: Time.zone.now - 9.minutes},
  { activity_stream_type_id: TypeLookup.by_name('create'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket4.id, created_by_id: customer4.id, created_at: Time.zone.now - 1.hour},
  { activity_stream_type_id: TypeLookup.by_name('create'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket5.id, created_by_id: customer5.id, created_at: Time.zone.now - 1.hour},
  { activity_stream_type_id: TypeLookup.by_name('update'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket1.id, created_by_id: customer1.id, created_at: Time.zone.now - 30.minutes},
  { activity_stream_type_id: TypeLookup.by_name('update'), activity_stream_object_id: ObjectLookup.by_name('Ticket'), permission_id: Permission.lookup(name: 'ticket.agent'), group_id: 1, o_id: ticket7.id, created_by_id: agent3.id, created_at: Time.zone.now},
])


# dashboard stats
Scheduler.create_or_update(
  name: 'Generate user based stats.',
  active: false,
)
Scheduler.create_or_update(
  name: 'Delete old stats store entries.',
  active: false,
)

# StatsStore.create_or_update()
User.all.each {|user|
  StatsStore.sync(
    object: 'User',
    o_id: user.id,
    key: 'dashboard',
    related_o_id: nil,
    related_stats_store_object_id: nil,
    data: {
# -CHANNEL DISTRIBUTION
#   email 40/33
#   phone 12/66
#   twitter 14/17
#   facebook 8/2
      StatsTicketChannelDistribution: {
        channels: {
          email: {
            icon: 'email',
            inbound: 40,
            outbound: 33,
            inbound_in_percent: 55,
            outbound_in_percent: 45,
          },
          phone: {
            icon: 'phone',
            inbound: 12,
            outbound: 66,
            inbound_in_percent: 12,
            outbound_in_percent: 88,
          },
          twitter: {
            icon: 'twitter',
            inbound: 14,
            outbound: 17,
            inbound_in_percent: 48,
            outbound_in_percent: 52,
          },
          facebook: {
            icon: 'facebook',
            inbound: 8,
            outbound: 2,
            inbound_in_percent: 10,
            outbound_in_percent: 6,
          }
        }
      },
# -YOUR TICKETS IN PROCESS
#   85%/79%
      StatsTicketInProcess: {
        used_for_average: 79,
        average_per_agent: 79,
        state: 'supergood',
        in_process: 0,
        percent: 85,
        total: 0,
      },
# -ASSIGNED
#   34/233/24
      StatsTicketLoadMeasure: {
        used_for_average: 34,
        average_per_agent: 24,
        percent: 0.0,
        state: 'ok',
        own: 34,
        total: 233,
        average_per_agent_in_percent: 0.0,
      },
# -MOOD 0/0
      StatsTicketEscalation: {
        used_for_average: 0,
        average_per_agent: 0.0,
        state: 'supergood',
        own: 0,
        total: 0,
      },
# -REOPENING RATE
#   1%/2%
      StatsTicketReopen: {
        used_for_average: 1,
        percent: 2,
        average_per_agent: 0.0,
        state: 'good',
        count:0,
        total:0,
      },
# -WAITING TIME TODAY
#   21 min/avg. 35 min
      TicketResponseTime: {
        handling_time: 24,
        average_per_agent: 38,
        state: 'good',
      },
    },
  )
}

# create tasks
UserInfo.current_user_id = agent1.id
Taskbar.create!([
  { user_id: agent1.id, last_contact: "2016-10-05 22:58:57", client_id: "123", key: "Ticket-5", callback: "TicketZoom", state: {"ticket"=>{"owner_id"=>"5"}, "article"=>{}}, params: {"ticket_id"=>"5", "shown"=>true}, prio: 3, notify: false, active: false },
  { user_id: agent1.id, last_contact: "2016-10-05 22:58:27", client_id: "123", key: "Organization-3", callback: "OrganizationProfile", state: {}, params: {"organization_id"=>"3", "shown"=>true}, prio: 4, notify: false, active: false },
  { user_id: agent1.id, last_contact: "2016-10-05 23:01:37", client_id: "123", key: "Ticket-3", callback: "TicketZoom", state: {"ticket"=>{}, "article"=>{}}, params: {"ticket_id"=>"3", "shown"=>true}, prio: 7, notify: false, active: false },
  { user_id: agent1.id, last_contact: "2016-10-05 22:58:38", client_id: "123", key: "User-8", callback: "UserProfile", state: {}, params: {"user_id"=>"8", "shown"=>true}, prio: 6, notify: false, active: false },
  { user_id: agent1.id, last_contact: "2016-10-05 22:58:38", client_id: "123", key: "User-6", callback: "UserProfile", state: {}, params: {"user_id"=>"6", "shown"=>true}, prio: 5, notify: false, active: false },
  { user_id: agent1.id, last_contact: "2016-10-05 22:58:57", client_id: "123", key: "Ticket-6", callback: "TicketZoom", state: {"ticket"=>{}, "article"=>{}}, params: {"ticket_id"=>"6", "shown"=>true}, prio: 2, notify: false, active: false },
  { user_id: agent1.id, last_contact: "2016-10-05 23:02:53", client_id: "123", key: "Ticket-8", callback: "TicketZoom", state: {"ticket"=>{"owner_id"=>"3"}, "article"=>{"body"=>"Hello Emily,<div><br></div><div>Thank you for the feedback.<br><br><div data-signature=\"true\" data-signature-id=\"1\">  Christopher Miller<br><br>--<br> Super Support - Waterford Business Park<br> 5201 Blue Lagoon Drive - 8th Floor &amp; 9th Floor - Miami, 33126 USA<br> Email: hot@example.com - Web: http://www.example.com/<br>--</div></div>", "type"=>"email", "internal"=>"", "to"=>"emily@example.com"}}, params: {"ticket_id"=>8, "overview_id"=>2, "shown"=>true}, prio: 1, notify: false, active: true}
])

Cti::Log.create(
  direction: 'in',
  from: '4930609854180',
  from_comment: customer1.fullname,
  to: '4930609811111',
  to_comment: agent1.fullname,
  call_id: '00001',
  comment: '',
  state: 'newCall',
  done: false,
  preferences: {
    from: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'known',
        object: 'User',
        o_id: 2,
        user_id: 2,
      }
    ]
  },
  created_at: Time.zone.now,
)

Cti::Log.create(
  direction: 'out',
  from: '4930609854180',
  from_comment: customer2.fullname,
  to: '4930609811111',
  to_comment: agent2.fullname,
  call_id: '00002',
  comment: '',
  state: 'newCall',
  preferences: {
    to: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'known',
        object: 'User',
        o_id: customer2.id,
        user_id: customer2.id,
      }
    ]
  },
  created_at: Time.zone.now - 2.minutes,
)

Cti::Log.create(
  direction: 'in',
  from: '4930609854180',
  from_comment: customer3.fullname,
  to: '4930609811111',
  to_comment: agent2.fullname,
  call_id: '00003',
  comment: '',
  state: 'answer',
  preferences: {
    from: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'known',
        object: 'User',
        o_id: customer3.id,
        user_id: customer3.id,
      }
    ]
  },
  created_at: Time.zone.now - 5.minutes,
)

Cti::Log.create(
  direction: 'in',
  from: '4930609854180',
  from_comment: customer4.fullname,
  to: '4930609811111',
  to_comment: agent3.fullname,
  call_id: '00004',
  state: 'hangup',
  comment: 'normalClearing',
  done: false,
  preferences: {
    from: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'known',
        object: 'User',
        o_id: customer4.id,
        user_id: customer4.id,
      }
    ]
  },
  created_at: Time.zone.now - 2.minutes,
)

Cti::Log.create(
  direction: 'in',
  from: '4930609854180',
  from_comment: customer5.fullname,
  to: '4930609811111',
  to_comment: agent2.fullname,
  call_id: '00005',
  comment: '',
  state: 'hangup',
  start: Time.zone.now - 35.seconds,
  'end': Time.zone.now,
  preferences: {
    from: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'known',
        object: 'User',
        o_id: customer5.id,
        user_id: customer5.id,
      }
    ]
  },
  created_at: Time.zone.now - 1.hour,
)

Cti::Log.create(
  direction: 'in',
  from: '4930609854180',
  from_comment: customer2.fullname,
  to: '4930609811111',
  to_comment: '',
  call_id: '00006',
  comment: '',
  state: 'hangup',
  start: Time.zone.now - 2.minutes,
  'end': Time.zone.now,
  preferences: {
    from: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'known',
        o_id: customer2.id,
        user_id: customer2.id,
      }
    ]
  },
  created_at: Time.zone.now - 2.hour,
)

Cti::Log.create(
  direction: 'in',
  from: '4930609854180',
  from_comment: customer3.fullname,
  to: '4930609811111',
  to_comment: agent1.fullname,
  call_id: '00007',
  comment: '',
  state: 'hangup',
  start: Time.zone.now - 30.seconds,
  'end': Time.zone.now,
  preferences: {
    from: [
      {
        caller_id: '4930726128135',
        comment: nil,
        level: 'maybe',
        object: 'User',
        o_id: customer3.id,
        user_id: customer3.id,
      }
    ]
  },
  created_at: Time.zone.now - 5.hour,
)


Setting.set('slack_integration', true)
Setting.set('sipgate_integration', true)
Setting.set('chat', true)

Setting.set('import_mode', false)

## Screenshots
# Login
# Dashboard + Activity Stream
# Dashboard + Activity Stream + Online Notifications
# Ticket Zoom - minimal
# Ticket Zoom - minimal + expand
# Ticket Zoom - reply + shortcut ::thanks
# Overviews
# Shortcuts
# Search "em" + hover ticket
# Search expanded "e" + hover ticket
# Admin Chat + Preview rhb.ch
# Admin Chat + Snipped c&p
# Preferences + Language Pulldown
# Inline Übersetzungen

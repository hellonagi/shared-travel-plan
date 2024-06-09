require 'open-uri'

image_files = [
  Rails.root.join('db/seeds/images/dummy1.jpg'),
  Rails.root.join('db/seeds/images/dummy2.jpg')
]

puts 'Seeding users...'

User.destroy_all
mike = User.create!(name: 'mike',
                    password: 'password')
bob = User.create!(name: 'bob',
                   password: 'password')

puts 'Seeding todos...'

Todo.destroy_all

t1 = Todo.create!(
  title: '東京の美味しいレストラン',
  description: 'ここは行っておきたいレストランをピックアップ。医食同源を体現した料理を7つの異なるコンセプトの席で味わう「日月火 銀座店」など、おすすめ東京グルメをご紹介！',
  user: mike
)

t2 = Todo.create!(
  title: '北海道のオススメ海鮮',
  description: '新鮮＆豪快！北の大地で味わう海鮮はこれに決まり',
  user: mike
)

puts 'Seeding todolists...'

Todolist.destroy_all

tdl1 = Todolist.create!(
  latitude: 35.6741431,
  longitude: 139.761986,
  details: '医食同源を体現した料理を7つの異なるコンセプトの席で味わう。優雅さと重厚感で織りなされた、7つの情景が広がるフロア。オープンキッチンカウンター、池の上の桟敷や離れ、心静まる茶室風の席…格調とモダンが調和する和の空間をみごとに表現したお店です。',
  todo: t1
)

tdl1.image.attach(
  io: File.open(image_files[0]),
  filename: 'dummy1.jpg',
  content_type: 'image/jpg'
)

tdl2 = Todolist.create!(
  latitude: 35.6823799,
  longitude: 139.7668608,
  details: 'ピザ発祥の地の小麦粉だから生まれるモッチモチの食感
本格石釜で焼き上げる13種のこだわりピッツァ、海の香り漂う産地直送シーフード、リーズナブルなアンティパスト。',
  todo: t1
)

tdl2.image.attach(
  io: File.open(image_files[1]),
  filename: 'dummy2.jpg',
  content_type: 'image/jpg'
)

puts 'Seeding completed.'

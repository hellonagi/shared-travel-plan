require 'open-uri'

image_files = [
  Rails.root.join('db/seeds/images/dummy1.jpg'),
  Rails.root.join('db/seeds/images/dummy2.jpg'),
  Rails.root.join('db/seeds/images/koyo-shiga.jpg'),
  Rails.root.join('db/seeds/images/koyo-tachikawa.jpg'),
  Rails.root.join('db/seeds/images/koyo-kyoto.jpg'),
  Rails.root.join('db/seeds/images/koyo-ibaraki.jpg'),
  Rails.root.join('db/seeds/images/koyo-tukuba.jpg'),
  Rails.root.join('db/seeds/images/ramen-hyogo.jpeg'),
  Rails.root.join('db/seeds/images/ramen-saitama.jpeg'),
  Rails.root.join('db/seeds/images/ramen-toyama.jpeg'),
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


t3 = Todo.create!(
  title: '全国の人気紅葉名所5選',
  description: '特に注目度の高かった5つの人気紅葉スポットを紹介！今年のおでかけ先を探してみよう。',
  user: mike
)

t4 = Todo.create!(
  title: '日本全国ぜひとも食べたいラーメン3選',
  description: '- 今回は2023印象に残ったラーメンを発表！！気になったお店があればぜひチェックしてみてくださいねー！',
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


tdl3 = Todolist.create!(
  latitude: 35.4776541,
  longitude: 136.0342092,
  details: 'メタセコイア並木(滋賀県) / 例年の見頃時期：11月下旬～12月上旬',
  todo: t3
)

tdl3.image.attach(
  io: File.open(image_files[2]),
  filename: 'koyo-shiga.jpg',
  content_type: 'image/jpg'
)

tdl4 = Todolist.create!(
  latitude: 35.709398,
  longitude: 139.3878562,
  details: '国営昭和記念公園(東京都) / 例年の見頃時期：10月下旬～11月下旬',
  todo: t3
)

tdl4.image.attach(
  io: File.open(image_files[3]),
  filename: 'koyo-tachikawa.jpg',
  content_type: 'image/jpg'
)

tdl5 = Todolist.create!(
  latitude: 35.0145812,
  longitude: 135.4894901,
  details: '永観堂 禅林寺(京都府) / 例年の見頃時期：11月中旬～11月下旬',
  todo: t3
)

tdl5.image.attach(
  io: File.open(image_files[4]),
  filename: 'koyo-kyoto.jpg',
  content_type: 'image/jpg'
)

tdl6 = Todolist.create!(
  latitude: 36.7234819,
  longitude: 140.558029,
  details: '花貫渓谷(茨城県) / 例年の見頃時期：11月中旬～11月下旬',
  todo: t3
)

tdl6.image.attach(
  io: File.open(image_files[5]),
  filename: 'koyo-ibaraki.jpg',
  content_type: 'image/jpg'
)

tdl7 = Todolist.create!(
  latitude: 36.225392,
  longitude: 140.0971928,
  details: '筑波山(茨城県) / 例年の見頃時期：11月上旬～11月下旬
',
  todo: t3
)

tdl7.image.attach(
  io: File.open(image_files[6]),
  filename: 'koyo-tukuba.jpg',
  content_type: 'image/jpg'
)

tdl8 = Todolist.create!(
  latitude: 34.7432334,
  longitude: 135.409526,
  details: '《ayairo》（兵庫・塚口）',
  todo: t4
)

tdl8.image.attach(
  io: File.open(image_files[7]),
  filename: 'ramen-hyogo.jpg',
  content_type: 'image/jpg'
)

tdl9 = Todolist.create!(
  latitude: 36.0399943,
  longitude: 139.6477168,
  details: '《食煅もみじ （じきたん》（埼玉・新白岡）',
  todo: t4
)

tdl9.image.attach(
  io: File.open(image_files[8]),
  filename: 'ramen-saitama.jpg',
  content_type: 'image/jpg'
)

tdl10 = Todolist.create!(
  latitude: 36.8557214,
  longitude: 136.9838104,
  details: '《貪瞋癡 （とんじんち）》（富山・氷見）',
  todo: t4
)

tdl10.image.attach(
  io: File.open(image_files[9]),
  filename: 'ramen-toyama.jpg',
  content_type: 'image/jpg'
)
puts 'Seeding completed.'

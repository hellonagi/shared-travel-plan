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
  Rails.root.join('db/seeds/images/sky-hakuba.jpg'),
  Rails.root.join('db/seeds/images/sky-iwate.jpg'),
  Rails.root.join('db/seeds/images/sky-niigata.jpg'),
  Rails.root.join('db/seeds/images/sky-hokkaido.jpg'),
  Rails.root.join('db/seeds/images/sky-nagano.jpg'),
  Rails.root.join('db/seeds/images/sky-niseko.jpg'),
  Rails.root.join('db/seeds/images/sky-zao.jpg'),
  Rails.root.join('db/seeds/images/diving-miyakozima.jpg'),
  Rails.root.join('db/seeds/images/diving-ishigakizima.jpg'),
  Rails.root.join('db/seeds/images/diving-shikinezima.jpg'),
  Rails.root.join('db/seeds/images/diving-ogasawara.jpg'),
  Rails.root.join('db/seeds/images/diving-kagoshima.jpg'),
  Rails.root.join('db/seeds/images/ramen.png'),
  Rails.root.join('db/seeds/images/ramen2.jpg'),
  Rails.root.join('db/seeds/images/ramen3.jpg'),
  Rails.root.join('db/seeds/images/ramen4.jpg'),
  Rails.root.join('db/seeds/images/ramen5.jpg'),
  Rails.root.join('db/seeds/images/ramen6.jpg'),
  Rails.root.join('db/seeds/images/ramen7.jpg'),
  Rails.root.join('db/seeds/images/ramen8.jpg'),
]

puts 'Seeding users...'

User.destroy_all
mike = User.create!(name: 'mike',
                    password: 'password')
bob = User.create!(name: 'bob',
                   password: 'password')

iwasaki = User.create!(name: 'iwasaki',
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

t5 = Todo.create!(
  title: '一度は行きたい日本のスキーリゾート',
  description: '近年、日本国内にあるスキー場は海外からも注目され、各国の富裕層が訪れる一大観光地となりつつあります。リゾート化が進み、ますます快適にスキーやスノーボードが楽しめるようになったスキー場を訪れ、思い思いに冬の休日を過ごしてみませんか。',
  user: mike
)

t6 = Todo.create!(
  title: '国内のおすすめダイビングスポット',
  description: '理想的なダイビングスポットというと、まず海外のビーチを思い浮かべる方も多いかもしれませんが、実は国内にも驚くほどの透明度を誇る海はたくさん！中でも有名な沖縄のダイビングスポットをはじめ、今回は全国各地にあるおすすめダイビングスポットを選りすぐってご紹介していきます。',
  user: mike
)

t7 = Todo.create!(
  title: 'ラーメン職人が教えるおすすめ店',
  description: 'ラーメンについて語ります',
  user: mike
)

t8 = Todo.create!(
  title: 'ラーメン日記',
  description: '日々のラーメン日記を投稿します',
  user: mike
)

t9 = Todo.create!(
  title: 'ラーメン旅行',
  description: '東京だけでなく様々な観光地での思い出のラーメンを投稿します',
  user: mike
)

t10 = Todo.create!(
  title: 'ラーメンLove',
  description: 'test',
  user: bob
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

tdl11 = Todolist.create!(
  latitude: 36.6908946,
  longitude: 137.516094,
  details: '冬季五輪の舞台、白馬ならではのウィンタースポーツ体験で気分はアスリート',
  todo: t5
)

tdl11.image.attach(
  io: File.open(image_files[10]),
  filename: 'sky-hakuba.jpg',
  content_type: 'image/jpg'
)

tdl12 = Todolist.create!(
  latitude: 40.0047999,
  longitude: 140.9663302,
  details: '八幡平の安比高原リゾートでスキーと雪景色を楽しむ大人の休日を',
  todo: t5
)

tdl12.image.attach(
  io: File.open(image_files[11]),
  filename: 'sky-iwate.jpg',
  content_type: 'image/jpg'
)

tdl13 = Todolist.create!(
  latitude: 36.8505748,
  longitude: 138.6357571,
  details: '時代をつくってきた苗場のスキーリゾートは世代を超えて遊べるスノーパラダイス',
  todo: t5
)

tdl13.image.attach(
  io: File.open(image_files[12]),
  filename: 'sky-niigata.jpg',
  content_type: 'image/jpg'
)

tdl14 = Todolist.create!(
  latitude: 42.7396852,
  longitude: 140.8752705,
  details: '世界が認めるルスツリゾートはゲレンデからアフタースキーまで至れり尽くせり',
  todo: t5
)

tdl14.image.attach(
  io: File.open(image_files[13]),
  filename: 'sky-hokkaido.jpg',
  content_type: 'image/jpg'
)

tdl15 = Todolist.create!(
  latitude: 36.9106822,
  longitude: 138.4241122,
  details: '野沢温泉郷にあるスキーリゾートはゲレンデから旅館の温泉まで即アクセス可能',
  todo: t5
)

tdl15.image.attach(
  io: File.open(image_files[14]),
  filename: 'sky-nagano.jpg',
  content_type: 'image/jpg'
)

tdl16 = Todolist.create!(
  latitude: 42.885775,
  longitude: 140.6541231,
  details: '国際リゾートのニセコで世界中のスキーヤーが憧れるパウダースノーを満喫',
  todo: t5
)

tdl16.image.attach(
  io: File.open(image_files[15]),
  filename: 'sky-niseko.jpg',
  content_type: 'image/jpg'
)

tdl17 = Todolist.create!(
  latitude: 38.1641644,
  longitude: 140.3682303,
  details: '蔵王の樹氷を眺めながら抜群の雪質を堪能できるスキーリゾート',
  todo: t5
)

tdl17.image.attach(
  io: File.open(image_files[16]),
  filename: 'sky-zao.jpg',
  content_type: 'image/jpg'
)

tdl18 = Todolist.create!(
  latitude: 24.812951,
  longitude: 125.2785313,
  details: '国内のダイビングスポットを語るならやっぱり沖縄ははずせない！
ということで、まずご紹介するのは沖縄県にある離島のひとつ、宮古島です。',
  todo: t6
)

tdl18.image.attach(
  io: File.open(image_files[17]),
  filename: 'diving-miyakozima.jpg',
  content_type: 'image/jpg'
)

tdl19 = Todolist.create!(
  latitude: 24.4712799,
  longitude: 124.0401864,
  details: '透き通った海の中を悠々と泳ぎまわるマンタに出会えるダイビングスポットとして有名で、美しい砂地や華やかなサンゴなど、この世の楽園と見まがう光景の連続でダイバーたちを楽しませてくれます。',
  todo: t6
)

tdl19.image.attach(
  io: File.open(image_files[18]),
  filename: 'diving-ishigakizima.jpg',
  content_type: 'image/jpg'
)

tdl20 = Todolist.create!(
  latitude: 34.3264987,
  longitude: 139.2002702,
  details: '伊豆諸島のひとつである式根島は、人口わずか600人ほどの小さな島です。
島をぐるっと取り囲むのは、ここって本当に日本なの！？と思わず息を呑んでしまうくらい、透き通ったエメラルドグリーンの海。',
  todo: t6
)

tdl20.image.attach(
  io: File.open(image_files[19]),
  filename: 'diving-shikinezima.jpg',
  content_type: 'image/jpg'
)

tdl21 = Todolist.create!(
  latitude: 27.1844715,
  longitude: 140.9325061,
  details: '国内有数の透明度を誇る海といえば、小笠原諸島も見逃せません。',
  todo: t6
)

tdl21.image.attach(
  io: File.open(image_files[20]),
  filename: 'diving-ogasawara.jpg',
  content_type: 'image/jpg'
)

tdl22 = Todolist.create!(
  latitude: 27.0434732,
  longitude: 128.3488632,
  details: '映画『めがね』のロケ地となったことで知られている与論島は、透明度抜群の海を生かしたダイビングスポットとしても有名です。',
  todo: t6
)

tdl22.image.attach(
  io: File.open(image_files[21]),
  filename: 'diving-kagoshima.jpg',
  content_type: 'image/jpg'
)

tdl23 = Todolist.create!(
  latitude: 27.0434732,
  longitude: 128.3488632,
  details: 'ラーメン1',
  todo: t7
)

tdl23.image.attach(
  io: File.open(image_files[22]),
  filename: 'ramen.png',
  content_type: 'image/jpg'
)

tdl24 = Todolist.create!(
  latitude: 27.1844715,
  longitude: 140.9325061,
  details: '2024年5月4日',
  todo: t8
)
tdl24.image.attach(
  io: File.open(image_files[23]),
  filename: 'ramen2.png',
  content_type: 'image/jpg'
)


tdl25 = Todolist.create!(
  latitude: 27.1844715,
  longitude: 140.9325061,
  details: '2024年5月5日',
  todo: t8
)

tdl25.image.attach(
  io: File.open(image_files[24]),
  filename: 'ramen3.png',
  content_type: 'image/jpg'
)

tdl26 = Todolist.create!(
  latitude: 43.4631317,
  longitude: 141.8881767,
  details: '北海道での思い出ラーメン',
  todo: t9
)

tdl26.image.attach(
  io: File.open(image_files[25]),
  filename: 'ramen5.png',
  content_type: 'image/jpg'
)

tdl27 = Todolist.create!(
  latitude: 40.5032082,
  longitude: 141.2186457,
  details: '青森での思い出ラーメン',
  todo: t9
)

tdl27.image.attach(
  io: File.open(image_files[26]),
  filename: 'ramen5.png',
  content_type: 'image/jpg'
)

tdl27 = Todolist.create!(
  latitude: 35.3396092,
  longitude: 139.9165649,
  details: 'd',
  todo: t9
)

tdl27.image.attach(
  io: File.open(image_files[27]),
  filename: 'ramen6.png',
  content_type: 'image/jpg'
)

tdl28 = Todolist.create!(
  latitude: 35.3396092,
  longitude: 139.9165649,
  details: 'd',
  todo: t9
)

tdl28.image.attach(
  io: File.open(image_files[28]),
  filename: 'ramen7.png',
  content_type: 'image/jpg'
)
puts 'Seeding completed.'

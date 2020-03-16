# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingredient = Category.create(:name=>"食材")
price      = Category.create(:name=>"予算")
time       = Category.create(:name=>"所要時間")

carrots  = ingredient.children.create(:name=>"野菜")
meets    = ingredient.children.create(:name=>"肉")
fishies  = ingredient.children.create(:name=>"魚介")
noodles  = ingredient.children.create(:name=>"麺類")
riceBowls = ingredient.children.create(:name=>"ごはんもの")

price300 = price.children.create(:name=>"0~300円")
price600 = price.children.create(:name=>"301~600円")
price1000 = price.children.create(:name=>"600~1000円")

time5 = time.children.create(:name=>"0~5分")
time10 = time.children.create(:name=>"5~10分")
time15 = time.children.create(:name=>"11~15分")
time20 = time.children.create(:name=>"15~20分")

carrots.children.create([{:name=>"にんじん"},{:name=>"たまねぎ"},{:name=>"じゃがいも"},{:name=>"キャベツ"},{:name=>"きのこ"},{:name=>"旬野菜（春）"},{:name=>"旬野菜（夏）"},{:name=>"旬野菜（秋・冬"},{:name=>"その他野菜類"}]) 
meets.children.create([{:name=>"牛肉"},{:name=>"豚肉"},{:name=>"鶏肉"},{:name=>"ウインナー"},{:name=>"ハム"},{:name=>"ベーコン"},{:name=>"その他肉類"}])
fishies.children.create([{:name=>"サケ"},{:name=>"イワシ"},{:name=>"サバ"},{:name=>"アジ"},{:name=>"ブリ"},{:name=>"サンマ"},{:name=>"マグロ"},{:name=>"エビ"},{:name=>"イカ"},{:name=>"タコ"},{:name=>"貝類"},{:name=>"その他魚介類"}])
noodles.children.create([{:name=>"うどん"},{:name=>"ラーメン"},{:name=>"そば"},{:name=>"そうめん"},{:name=>"その他麺類"}])
riceBowls.children.create([{:name=>"カレー"},{:name=>"オムライス"},{:name=>"すし"},{:name=>"チャーハン"},{:name=>"リゾット"},{:name=>"おじや"},{:name=>"炊き込みご飯"},{:name=>"その他ごはんもの"}]) 

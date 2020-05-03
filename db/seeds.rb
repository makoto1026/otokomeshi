vegetables  = Category.create(:name=>"野菜のおかず")
meets    = Category.create(:name=>"肉のおかず")
fishies  = Category.create(:name=>"魚介のおかず")
noodles  = Category.create(:name=>"麺類")
riceBowls = Category.create(:name=>"ごはんもの")

vegetables.children.create([{:name=>"にんじん"},{:name=>"たまねぎ"},{:name=>"じゃがいも"},{:name=>"キャベツ"},{:name=>"きのこ"},{:name=>"だいこん"},{:name=>"ピーマン"},{:name=>"ナス"},{:name=>"トマト"},{:name=>"その他野菜"}]) 
meets.children.create([{:name=>"牛肉"},{:name=>"豚肉"},{:name=>"鶏肉"},{:name=>"ウインナー"},{:name=>"ハム"},{:name=>"ベーコン"},{:name=>"その他肉類"}])
fishies.children.create([{:name=>"サケ"},{:name=>"イワシ"},{:name=>"サバ"},{:name=>"アジ"},{:name=>"ブリ"},{:name=>"サンマ"},{:name=>"マグロ"},{:name=>"エビ"},{:name=>"イカ"},{:name=>"タコ"},{:name=>"貝類"},{:name=>"その他魚介"}])
noodles.children.create([{:name=>"うどん"},{:name=>"ラーメン"},{:name=>"そば"},{:name=>"そうめん"},{:name=>"その他麺類"}])
riceBowls.children.create([{:name=>"カレー"},{:name=>"オムライス"},{:name=>"すし"},{:name=>"チャーハン"},{:name=>"リゾット"},{:name=>"おじや"},{:name=>"炊き込みご飯"},{:name=>"その他ごはんもの"}]) 



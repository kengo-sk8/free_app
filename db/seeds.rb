# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  lady = Category.create(name: "レディース")
  man = Category.create(name: "メンズ")
  baby = Category.create(name: "ベビー・キッズ")
  home = Category.create(name: "インテリア・住まい・小物")
  book = Category.create(name: "本・音楽・ゲーム")
  hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
  beauty = Category.create(name: "コスメ・香水・美容")
  mech = Category.create(name: "家電・スマホ・カメラ")
  sport = Category.create(name: "スポーツ・レジャー")
  handmade = Category.create(name: "ハンドメイド")
  ticket = Category.create(name: "チケット")
  mobil = Category.create(name: "自動車・オートバイ")
  other = Category.create(name: "その他")
  
  # レディースの子カテゴリ
  lady_tops = lady.children.create(name: "トップス")
  lady_jacket = lady.children.create(name: "ジャケット/アウター")
  lady_pants = lady.children.create(name: "パンツ")
  lady_skirt = lady.children.create(name: "スカート")
  lady_onepiece = lady.children.create(name: "ワンピース")
  lady_other = lady.children.create(name: "その他")
  # レディースの孫カテゴリ
  lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ/ブラウス(半袖/袖なし)"}, {name: "シャツ/ブラウス(七分/長袖)"}, {name: "ポロシャツ"}, {name: "キャミソール"}, {name: "タンクトップ"}, {name: "ホルターネック"}, {name: "ニット/セーター"}, {name: "チュニック"}, {name: "カーディガン/ボレロ"}, {name: "アンサンブル"}, {name: "ベスト/ジレ"}, {name: "パーカー"}, {name: "トレーナー/スウェット"}, {name: "ベアトップ/チューブトップ"}, {name: "ジャージ"}, {name: "その他"}])
  lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ミリタリージャケット"}, {name: "ダウンベスト"}, {name: "ジャンパー/ブルゾン"}, {name: "ポンチョ"}, {name: "ロングコート"}, {name: "トレンチコート"}, {name: "ダッフルコート"}, {name: "ピーコート"}, {name: "チェスターコート"}, {name: "モッズコート"}, {name: "スタジャン"}, {name: "毛皮/ファーコート"}, {name: "スプリングコート"}, {name: "スカジャン"}, {name: "その他"}])
  lady_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "クロップドパンツ"}, {name: "サロペット/オーバーオール"}, {name: "オールインワン"}, {name: "サルエルパンツ"}, {name: "ガウチョパンツ"}, {name: "その他"}])
  lady_skirt.children.create([{name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"}, {name: "キュロット"}, {name: "その他"}])
  lady_onepiece.children.create([{name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"}, {name: "その他"}])
  lady_other.children.create([{name: "スカートスーツ上下"}, {name: "パンツスーツ上下"}, {name: "ドレス"}, {name: "パーティーバッグ"}, {name: "シューズ"}, {name: "ウェディング"}])
  
  # メンズの子カテゴリ
  man_tops = man.children.create(name: "トップス")
  man_jacket = man.children.create(name: "ジャケット/アウター")
  man_pants = man.children.create(name: "パンツ")
  man_suits = man.children.create(name: "スーツ")
  man_other = man.children.create(name: "その他")
  # メンズの孫カテゴリ
  man_tops.children.create([{name: "トップス"}, {name: "アウター"}, {name: "パンツ"}, {name: "おくるみ"}, {name: "下着/肌着"}, {name: "パジャマ"}, {name: "ロンパース"}, {name: "その他"}])
  man_jacket.children.create([{name: "コート"}, {name: "ジャケット/上着"}, {name: "トップス(Tシャツ/カットソー)"}, {name: "トップス(トレーナー)"}, {name: "トップス(チュニック)"}, {name: "トップス(タンクトップ)"}, {name: "トップス(その他)"}])
  man_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "クロップドパンツ"}, {name: "サロペット/オーバーオール"}, {name: "オールインワン"}, {name: "サルエルパンツ"}, {name: "ガウチョパンツ"}, {name: "その他"}])
  man_suits.children.create([{name: "パンツ"}, {name: "セットアップ"}, {name: "パジャマ"}, {name: "フォーマル/ドレス"}, {name: "和服"}, {name: "浴衣"}, {name: "甚平"}, {name: "水着"}, {name: "その他"}])
  man_other.children.create([{name: "スニーカー"}, {name: "サンダル"}, {name: "ブーツ"}, {name: "長靴"}, {name: "靴下/スパッツ"}, {name: "帽子"}, {name: "エプロン"}, {name: "サスペンダー"}, {name: "タイツ"}, {name: "ハンカチ"}, {name: "バンダナ"}, {name: "ベルト"}, {name: "マフラー"}, {name: "傘"}, {name: "手袋"}, {name: "スタイ"}, {name: "バッグ"}, {name: "その他"}])
  
  # ベビーの子カテゴリ
  baby_girl = baby.children.create(name: "ベビー服(女の子用)")
  baby_boy = baby.children.create(name: "ベビー服(男の子用)")
  baby_item = baby.children.create(name: "子ども用ファッション小物")
  baby_toilet = baby.children.create(name: "おむつ/トイレ/バス")
  baby_other = baby.children.create(name: "その他")
  # ベビーの孫カテゴリ
  baby_girl.children.create([{name: "コート"}, {name: "ジャケット/上着"}, {name: "トップス(Tシャツ/カットソー)"}, {name: "トップス(トレーナー)"}, {name: "トップス(その他)"}, {name: "ボトムス"}, {name: "パジャマ"}, {name: "その他"}])
  baby_boy.children.create([{name: "コート"}, {name: "ジャケット/上着"}, {name: "トップス(Tシャツ/カットソー)"}, {name: "トップス(トレーナー)"}, {name: "トップス(その他)"}, {name: "ボトムス"}, {name: "パジャマ"}, {name: "その他"}])
  baby_item.children.create([{name: "おふろのおもちゃ"}, {name: "がらがら"}, {name: "オルゴール"}, {name: "ベビージム"}, {name: "手押し車/カタカタ"}, {name: "知育玩具"}, {name: "その他"}])
  baby_toilet.children.create([{name: "おむつ用品"}, {name: "おまる/補助便座"}, {name: "トレーニングパンツ"}, {name: "ベビーバス"}, {name: "お風呂用品"}, {name: "その他"}])
  baby_other.children.create([{name: "お宮参り用品"}, {name: "お食い初め用品"}, {name: "アルバム"}, {name: "手形/足形"}, {name: "その他"}])
  
  # 家庭用品の子カテゴリ
  home_kitchen = home.children.create(name: "キッチン/食器")
  home_bed = home.children.create(name: "ベッド/マットレス")
  home_sofa = home.children.create(name: "ソファ/ソファベッド")
  home_chair = home.children.create(name: "椅子/チェア")
  home_table = home.children.create(name: "机/テーブル")
  home_other = home.children.create(name: "その他")
  # 家庭用品の孫カテゴリ
  home_kitchen.children.create([{name: "食器"}, {name: "調理器具"}, {name: "収納/キッチン雑貨"}, {name: "弁当用品"}, {name: "カトラリー(スプーン等)"}, {name: "テーブル用品"}, {name: "容器"}, {name: "エプロン"}, {name: "アルコールグッズ"}, {name: "浄水機"}, {name: "その他"}])
  home_bed.children.create([{name: "セミシングルベッド"}, {name: "シングルベッド"}, {name: "セミダブルベッド"}, {name: "ダブルベッド"}, {name: "ワイドダブルベッド"}, {name: "クイーンベッド"}, {name: "キングベッド"}, {name: "脚付きマットレスベッド"}, {name: "マットレス"}, {name: "すのこベッド"}, {name: "ロフトベッド/システムベッド"}, {name: "簡易ベッド/折りたたみベッド"}, {name: "収納付き"}, {name: "その他"}])
  home_sofa.children.create([{name: "ソファセット"}, {name: "シングルソファ"}, {name: "ラブソファ"}, {name: "トリプルソファ"}, {name: "オットマン"}, {name: "コーナーソファ"}, {name: "ビーズソファ/クッションソファ"}, {name: "ローソファ/フロアソファ"}, {name: "ソファベッド"}, {name: "応接セット"}, {name: "ソファカバー"}, {name: "リクライニングソファ"}, {name: "その他"}])
  home_chair.children.create([{name: "一般"}, {name: "スツール"}, {name: "ダイニングチェア"}, {name: "ハイバックチェア"}, {name: "ロッキングチェア"}, {name: "座椅子"}, {name: "折り畳みイス"}, {name: "デスクチェア"}, {name: "その他"}])
  home_table.children.create([{name: "こたつ"}, {name: "カウンターテーブル"}, {name: "サイドテーブル"}, {name: "センターテーブル"}, {name: "ダイニングテーブル"}, {name: "座卓/ちゃぶ台"}, {name: "アウトドア用"}, {name: "パソコン用"}, {name: "事務机/学習机"}, {name: "その他"}])
  home_other.children.create([{name: "正月"}, {name: "成人式"}, {name: "バレンタインデー"}, {name: "ひな祭り"}, {name: "子どもの日"}, {name: "母の日"}, {name: "父の日"}, {name: "サマーギフト/お中元"}, {name: "夏/夏休み"}, {name: "ハロウィン"}, {name: "敬老の日"}, {name: "七五三"}, {name: "お歳暮"}, {name: "クリスマス"}, {name: "冬一般"}, {name: "その他"}])
  
  # 本の子カテゴリ
  book_book = book.children.create(name: "本")
  book_manga = book.children.create(name: "漫画")
  book_cd = book.children.create(name: "CD")
  book_game = book.children.create(name: "テレビゲーム")
  # 本の孫カテゴリ
  book_book.children.create([{name: "文学/小説"}, {name: "人文/社会"}, {name: "ノンフィクション/教養"}, {name: "地図/旅行ガイド"}, {name: "ビジネス/経済"}, {name: "健康/医学"}, {name: "コンピュータ/IT"}, {name: "趣味/スポーツ/実用"}, {name: "住まい/暮らし/子育て"}, {name: "アート/エンタメ"}, {name: "洋書"}, {name: "絵本"}, {name: "参考書"}, {name: "その他"}])
  book_manga.children.create([{name: "全巻セット"}, {name: "少年漫画"}, {name: "少女漫画"}, {name: "青年漫画"}, {name: "女性漫画"}, {name: "同人誌"}, {name: "その他"}])
  book_cd.children.create([{name: "邦楽"}, {name: "洋楽"}, {name: "アニメ"}, {name: "クラシック"}, {name: "K-POP/アジア"}, {name: "キッズ/ファミリー"}, {name: "その他"}])
  book_game.children.create([{name: "家庭用ゲーム本体"}, {name: "家庭用ゲームソフト"}, {name: "携帯用ゲーム本体"}, {name: "携帯用ゲームソフト"}, {name: "PCゲーム"}, {name: "その他"}])
  
  # 趣味の子カテゴリ
  hobby_toy = hobby.children.create(name: "おもちゃ")
  hobby_card = hobby.children.create(name: "トレーディングカード")
  hobby_figure = hobby.children.create(name: "フィギュア")
  hobby_instrument = hobby.children.create(name: "楽器/器材")
  hobby_other = hobby.children.create(name: "その他")
  # 趣味の孫カテゴリ
  hobby_toy.children.create([{name: "キャラクターグッズ"}, {name: "ぬいぐるみ"}, {name: "小物/アクセサリー"}, {name: "模型/プラモデル"}, {name: "ミニカー"}, {name: "トイラジコン"}, {name: "プラモデル"}, {name: "ホビーラジコン"}, {name: "鉄道模型"}, {name: "その他"}])
  hobby_card.children.create([{name: "遊戯王"}, {name: "マジック：ザ・ギャザリング"}, {name: "ポケモンカードゲーム"}, {name: "デュエルマスターズ"}, {name: "バトルスピリッツ"}, {name: "プリパラ"}, {name: "アイカツ"}, {name: "カードファイト!!ヴァンガード"}, {name: "ヴァイスシュヴァルツ"}, {name: "プロ野球オーナーズリーグ"}, {name: "ベースボールヒーローズ"}, {name: "ドラゴンボール"}, {name: "スリーブ"}, {name: "その他"}])
  hobby_figure.children.create([{name: "コミック/アニメ"}, {name: "特撮"}, {name: "ゲームキャラクター"}, {name: "SF/ファンタジー/ホラー"}, {name: "アメコミ"}, {name: "スポーツ"}, {name: "ミリタリー"}, {name: "その他"}])
  hobby_instrument.children.create([{name: "エレキギター"}, {name: "アコースティックギター"}, {name: "ベース"}, {name: "エフェクター"}, {name: "アンプ"}, {name: "弦楽器"}, {name: "管楽器"}, {name: "鍵盤楽器"}, {name: "打楽器"}, {name: "和楽器"}, {name: "楽譜/スコア"}, {name: "レコーディング/PA機器"}, {name: "DJ機器"}, {name: "DTM/DAW"}, {name: "その他"}])
  hobby_other.children.create([{name: "トランプ/UNO"}, {name: "カルタ/百人一首"}, {name: "ダーツ"}, {name: "ビリヤード"}, {name: "麻雀"}, {name: "パズル/ジグソーパズル"}, {name: "囲碁/将棋"}, {name: "オセロ/チェス"}, {name: "人生ゲーム"}, {name: "野球/サッカーゲーム"}, {name: "スポーツ"}, {name: "三輪車/乗り物"}, {name: "ヨーヨー"}, {name: "模型製作用品"}, {name: "鉄道"}, {name: "航空機"}, {name: "アマチュア無線"}, {name: "パチンコ/パチスロ"}, {name: "その他"}])
  
  # 美容の子カテゴリ
  beauty_base = beauty.children.create(name: "ベースメイク")
  beauty_makeup = beauty.children.create(name: "メイクアップ")
  beauty_other = beauty.children.create(name: "その他")
  # 美容の孫カテゴリ
  beauty_base.children.create([{name: "ファンデーション"}, {name: "化粧下地"}, {name: "コントロールカラー"}, {name: "BBクリーム"}, {name: "CCクリーム"}, {name: "コンシーラー"}, {name: "フェイスパウダー"}, {name: "トライアルセット/サンプル"}, {name: "その他"}])
  beauty_makeup.children.create([{name: "アイシャドウ"}, {name: "口紅"}, {name: "リップグロス"}, {name: "リップライナー"}, {name: "チーク"}, {name: "フェイスカラー"}, {name: "マスカラ"}, {name: "アイライナー"}, {name: "つけまつげ"}, {name: "アイブロウペンシル"}, {name: "パウダーアイブロウ"}, {name: "眉マスカラ"}, {name: "トライアルセット/サンプル"}, {name: "メイク道具/化粧小物"}, {name: "美顔用品/美顔ローラー"}, {name: "その他"}])
  beauty_other.children.create([{name: "健康用品"}, {name: "看護/介護用品"}, {name: "救急/衛生用品"}, {name: "その他"}])
  
  # 機械の子カテゴリ
  mech_phone = mech.children.create(name: "スマートフォン/携帯電話")
  mech_pc = mech.children.create(name: "PC/タブレット")
  mech_camera = mech.children.create(name: "カメラ")
  mech_other = mech.children.create(name: "その他")
  # 機械の孫カテゴリ
  mech_phone.children.create([{name: "スマートフォン本体"}, {name: "バッテリー/充電器"}, {name: "携帯電話本体"}, {name: "PHS本体"}, {name: "その他"}])
  mech_pc.children.create([{name: "タブレット"}, {name: "ノートPC"}, {name: "デスクトップ型PC"}, {name: "ディスプレイ"}, {name: "電子ブックリーダー"}, {name: "PC周辺機器"}, {name: "PCパーツ"}, {name: "その他"}])
  mech_camera.children.create([{name: "デジタルカメラ"}, {name: "ビデオカメラ"}, {name: "レンズ(単焦点)"}, {name: "レンズ(ズーム)"}, {name: "フィルムカメラ"}, {name: "防犯カメラ"}, {name: "その他"}])
  mech_other.children.create([{name: "ポータブルプレーヤー"}, {name: "イヤフォン"}, {name: "ヘッドフォン"}, {name: "アンプ"}, {name: "スピーカー"}, {name: "ケーブル/シールド"}, {name: "ラジオ"}, {name: "その他"}])
  
  # スポーツの子カテゴリ
  sport_fishing = sport.children.create(name: "フィッシング")
  sport_training = sport.children.create(name: "トレーニング/エクササイズ")
  sport_soccer = sport.children.create(name: "サッカー/フットサル")
  sport_other = sport.children.create(name: "その他")
  # スポーツの孫カテゴリ
  sport_fishing.children.create([{name: "ロッド"}, {name: "リール"}, {name: "ルアー用品"}, {name: "ウエア"}, {name: "釣り糸/ライン"}, {name: "その他"}])
  sport_training.children.create([{name: "ランニング"}, {name: "ウォーキング"}, {name: "ヨガ"}, {name: "トレーニング用品"}, {name: "その他"}])
  sport_soccer.children.create([{name: "ウェア"}, {name: "シューズ"}, {name: "ボール"}, {name: "アクセサリー"}, {name: "記念グッズ"}, {name: "応援グッズ"}, {name: "その他"}])
  sport_other.children.create([{name: "ダンス/バレエ"}, {name: "サーフィン"}, {name: "バスケットボール"}, {name: "バドミントン"}, {name: "バレーボール"}, {name: "スケートボード"}, {name: "陸上競技"}, {name: "ラグビー"}, {name: "アメリカンフットボール"}, {name: "ボクシング"}, {name: "ボウリング"}, {name: "その他"}])
  
  # ハンドメイドの子カテゴリ
  handmade_item = handmade.children.create(name: "ファッション/小物")
  handmade_accessory = handmade.children.create(name: "アクセサリー/時計")
  handmade_interior = handmade.children.create(name: "日用品/インテリア")
  handmade_other = handmade.children.create(name: "その他")
  # ハンドメイドの孫カテゴリ
  handmade_item.children.create([{name: "ピアス"}, {name: "イヤリング"}, {name: "ネックレス"}, {name: "ブレスレット"}, {name: "リング"}, {name: "チャーム"}, {name: "ヘアゴム"}, {name: "アンクレット"}, {name: "その他"}])
  handmade_accessory.children.create([{name: "アクセサリー(男性用)"}, {name: "時計(女性用)"}, {name: "時計(男性用)"}, {name: "その他"}])
  handmade_interior.children.create([{name: "クラフト/布製品"}, {name: "おもちゃ/人形"}, {name: "その他"}])
  handmade_other.children.create([{name: "バッグ(女性用)"}, {name: "バッグ(男性用)"}, {name: "財布(女性用)"}, {name: "財布(男性用)"}, {name: "ファッション雑貨"}, {name: "その他"}])
  
  # チケットの子カテゴリ
  ticket_music = ticket.children.create(name: "音楽")
  ticket_sport = ticket.children.create(name: "スポーツ")
  ticket_show = ticket.children.create(name: "演劇/芸能")
  ticket_other = ticket.children.create(name: "その他")
  # チケットの孫カテゴリ
  ticket_music.children.create([{name: "男性アイドル"}, {name: "女性アイドル"}, {name: "韓流"}, {name: "国内アーティスト"}, {name: "海外アーティスト"}, {name: "音楽フェス"}, {name: "声優/アニメ"}, {name: "その他"}])
  ticket_sport.children.create([{name: "サッカー"}, {name: "野球"}, {name: "テニス"}, {name: "格闘技/プロレス"}, {name: "相撲/武道"}, {name: "ゴルフ"}, {name: "バレーボール"}, {name: "バスケットボール"}, {name: "モータースポーツ"}, {name: "ウィンタースポーツ"}, {name: "その他"}])
  ticket_show.children.create([{name: "ミュージカル"}, {name: "演劇"}, {name: "伝統芸能"}, {name: "落語"}, {name: "お笑い"}, {name: "オペラ"}, {name: "サーカス"}, {name: "バレエ"}, {name: "その他"}])
  ticket_other.children.create([{name: "ショッピング"}, {name: "レストラン/食事券"}, {name: "フード/ドリンク券"}, {name: "宿泊券"}, {name: "その他"}])
  
  # 自動車の子カテゴリ
  mobil_car = mobil.children.create(name: "自動車本体")
  mobil_carpart = mobil.children.create(name: "自動車アクセサリー")
  mobil_bike = mobil.children.create(name: "オートバイ車体")
  mobil_other = mobil.children.create(name: "その他")
  # 自動車の孫カテゴリ
  mobil_car.children.create([{name: "国内自動車本体"}, {name: "外国自動車本体"}, {name: "タイヤ/ホイールセット"}, {name: "タイヤ"}, {name: "ホイール"}, {name: "その他"}])
  mobil_carpart.children.create([{name: "車内アクセサリー"}, {name: "カーナビ"}, {name: "カーオーディオ"}, {name: "車外アクセサリー"}, {name: "メンテナンス用品"}, {name: "チャイルドシート"}, {name: "ドライブレコーダー"}, {name: "レーダー探知機"}, {name: "カタログ/マニュアル"}, {name: "セキュリティ"}, {name: "ETC"}, {name: "その他"}])
  mobil_bike.children.create([{name: "国内車本体"}, {name: "外国車本体"}, {name: "タイヤ"}, {name: "マフラー"}, {name: "エンジン、冷却装置"}, {name: "外国オートバイ用パーツ"}, {name: "その他"}])
  mobil_other.children.create([{name: "ヘルメット/シールド"}, {name: "バイクウエア/装備"}, {name: "アクセサリー"}, {name: "メンテナンス"}, {name: "カタログ/マニュアル"}, {name: "その他"}])
  
  # その他の子カテゴリ
  other_matome = other.children.create(name: "まとめ売り")
  other_food = other.children.create(name: "食品")
  other_drink = other.children.create(name: "飲料/酒")
  other_other = other.children.create(name: "その他")
  # その他の孫カテゴリ
  other_matome.children.create([{name: "ペットフード"}, {name: "犬用品"}, {name: "猫用品"}, {name: "魚用品/水草"}, {name: "小動物用品"}, {name: "爬虫類/両生類用品"}, {name: "かご/おり"}, {name: "鳥用品"}, {name: "虫類用品"}, {name: "その他"}])
  other_food.children.create([{name: "菓子"}, {name: "米"}, {name: "野菜"}, {name: "果物"}, {name: "調味料"}, {name: "魚介類(加工食品)"}, {name: "肉類(加工食品)"}, {name: "その他 加工食品"}, {name: "その他"}])
  other_drink.children.create([{name: "コーヒー"}, {name: "ソフトドリンク"}, {name: "ミネラルウォーター"}, {name: "茶"}, {name: "ウイスキー"}, {name: "ワイン"}, {name: "ブランデー"}, {name: "焼酎"}, {name: "日本酒"}, {name: "ビール、発泡酒"}, {name: "その他"}])
  other_other.children.create([{name: "オフィス用品一般"}, {name: "オフィス家具"}, {name: "店舗用品"}, {name: "OA機器"}, {name: "ラッピング/包装"}, {name: "その他"}])
# frozen_string_literal: true

flavors = [
  { en: 'oak',              ko: '오크 나무', ja: 'オークの木' },
  { en: 'spicy',            ko: '스파이시',  ja: 'スパイシー' },
  { en: 'peat',             ko: '매캐한 향', ja: 'ピートって' },
  { en: 'smoky',            ko: '스모키',   ja: 'スモーキー' },
  { en: 'apple',            ko: '사과',     ja: 'りんご' },
  { en: 'citrus',           ko: '감귤',     ja: 'シトラス' },
  { en: 'honey',            ko: '꿀',      ja: 'ハチミツ' },
  { en: 'cinnamon',         ko: '계피',     ja: 'シナモン' },
  { en: 'caramel',          ko: '캬라멜',   ja: 'キャラメル' },
  { en: 'green apple',      ko: '청사과',   ja: '青りんご' },
  { en: 'tea',              ko: '차', ja: '紅茶' },
  { en: 'sweet',            ko: '달콤', ja: '甘い' },
  { en: 'pear',             ko: '배', ja: '梨' },
  { en: 'almonds',          ko: '아몬드',   ja: 'アーモンド' },
  { en: 'black pepper',     ko: '후추',    ja: 'コショウ' },
  { en: 'smooth',           ko: '부드러움', ja: '柔らかさ' },
  { en: 'vanilla',          ko: '바닐라',   ja: 'バニラ' },
  { en: 'dried fruit',      ko: '건과일',   ja: 'ドライフルーツ' },
  { en: 'barley',           ko: '보리',    ja: '大麦' },
  { en: 'mango',            ko: '망고',    ja: 'マンゴー' },
  { en: 'apricot',          ko: '살구',    ja: 'アプリコット' },
  { en: 'tobacco',          ko: '담배',    ja: 'たばこ' },
  { en: 'charred',          ko: '탄 맛',   ja: '焦げた味' },
  { en: 'fresh ginger',     ko: '생강',    ja: '生姜' },
  { en: 'corn',             ko: '옥수수',   ja: 'トウモロコシ' },
  { en: 'salty',            ko: '짠 맛',   ja: '塩味' },
  { en: 'nutty',            ko: '견과류', ja: 'ナッツ類' },
  { en: 'oily',             ko: '오일리',   ja: 'オイリー' },
  { en: 'tropical fruits',  ko: '열대과일',  ja: 'トロピカルフルーツ' }
]

flavors.each do |flav|
  Flavor.i18n
        .find_or_initialize_by(name: flav[:en])
        .update!(name: flav[:en], name_ko: flav[:ko], name_ja: flav[:ja])
end

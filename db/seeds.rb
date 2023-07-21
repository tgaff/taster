# frozen_string_literal: true

flavors = [
  { en: 'oak',              ko: '오크 나무', ja: '' },
  { en: 'spicy',            ko: '스파이시', ja: '' },
  { en: 'peat',             ko: '매캐한 향', ja: '' },
  { en: 'smoky',            ko: '스모키', ja: '' },
  { en: 'apple',            ko: '사과', ja: '' },
  { en: 'citrus',           ko: '감귤', ja: '' },
  { en: 'honey',            ko: '꿀', ja: '' },
  { en: 'cinnamon',         ko: '계피', ja: '' },
  { en: 'caramel',          ko: '캬라멜', ja: '' },
  { en: 'green apple',      ko: '청사과ㅏ', ja: '' },
  { en: 'tea',              ko: '차', ja: '' },
  { en: 'sweet',            ko: '달콤', ja: '' },
  { en: 'pear',             ko: '배', ja: '' },
  { en: 'almonds',          ko: '아몬드', ja: '' },
  { en: 'black pepper',     ko: '후추', ja: '' },
  { en: 'smooth',           ko: '부드러움', ja: '' },
  { en: 'dried fruit',      ko: '건과일', ja: '' },
  { en: 'barley',           ko: '보리', ja: '' },
  { en: 'mango',            ko: '망고', ja: '' },
  { en: 'apricot',          ko: '살구', ja: '' },
  { en: 'tobacco',          ko: '담배', ja: '' },
  { en: 'charred',          ko: '탄 맛', ja: '' },
  { en: 'fresh ginger',     ko: '생강', ja: '' },
  { en: 'corn',             ko: '옥수수', ja: '' },
  { en: 'salty',            ko: '짠 맛', ja: '' },
  { en: 'nutty',            ko: '견과류', ja: '' },
  { en: 'oily',             ko: '오일리', ja: '' },
  { en: 'tropical fruits',  ko: '열대과일', ja: '' }
]

flavors.each do |flav|
  Flavor.i18n
        .find_or_initialize_by(name: flav[:en])
        .update!(name: flav[:en], name_ko: flav[:ko], name_ja: flav[:ja])
end

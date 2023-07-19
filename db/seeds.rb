flavors = [
  { en: 'oak',              ko: '', ja: '' },
  { en: 'spicy',            ko: '', ja: '' },
  { en: 'peat',             ko: '', ja: '' },
  { en: 'smoky',            ko: '', ja: '' },
  { en: 'apple',            ko: '', ja: '' },
  { en: 'citrus',           ko: '', ja: '' },
  { en: 'honey',            ko: '', ja: '' },
  { en: 'cinnamon',         ko: '', ja: '' },
  { en: 'caramel',          ko: '', ja: '' },
  { en: 'green apple',      ko: '', ja: '' },
  { en: 'tea',              ko: '', ja: '' },
  { en: 'caramel',          ko: '', ja: '' },
  { en: 'sweet',            ko: '', ja: '' },
  { en: 'pear',             ko: '', ja: '' },
  { en: 'almonds',          ko: '', ja: '' },
  { en: 'black peeper',     ko: '', ja: '' },
  { en: 'soft',             ko: '', ja: '' },
  { en: 'smooth',           ko: '', ja: '' },
  { en: 'dried fruit',      ko: '', ja: '' },
  { en: 'barley',           ko: '', ja: '' },
  { en: 'mango',            ko: '', ja: '' },
  { en: 'apricot',          ko: '', ja: '' },
  { en: 'tobacco',          ko: '', ja: '' },
  { en: 'charred',          ko: '', ja: '' },
  { en: 'fresh ginger',     ko: '', ja: '' },
  { en: 'corn',             ko: '', ja: '' },
  { en: 'salty',            ko: '', ja: '' },
  { en: 'nutty',            ko: '', ja: '' },
  { en: 'oily',             ko: '', ja: '' },
  { en: 'tropical fruits',  ko: '', ja: '' }
]

flavors.each do |flav|
  Flavor.i18n
    .find_or_initialize_by(name: flav[:en])
    .update!(name: flav[:en], name_ko: flav[:ko], name_ja: flav[:ja])
end
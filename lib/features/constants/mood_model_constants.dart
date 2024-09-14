class MoodModelConstants {
  static const List<String> moodTexts = [
    'Радость',
    'Страх',
    'Бешенство',
    'Грусть',
    'Спокойствие',
    'Сила'
  ];
  static const List<String> wrapItems = [
    'Возбуждение',
    'Восторг',
    'Игривость',
    'Наслаждение',
    'Очарование',
    'Осознанность',
    'Смелость',
    'Удовольствие',
    'Чувственность',
    'Энергичность',
    'Экстравагантность',
  ];

  static final List listOfMoods = List.generate(moodTexts.length,
      (e) => wrapItems.getRange(e, e == 0 ? 11 : e + 6).toList());
}

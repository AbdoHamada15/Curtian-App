class Story {
  final int id;
  final String title;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  const Story({
    required this.id,
    required this.title,
    required this.imageFileName,
    required this.iconFileName,
    required this.isViewed,
  });
}

const List<Story> stories = [
  Story(
    id: 1,
    title: 'بلتكانة',
    imageFileName: 'assets/img/stories/1.jpg',
    iconFileName: 'assets/img/icons/category_1.png',
    isViewed: false,
  ),
  Story(
    id: 2,
    title: 'مواسير',
    imageFileName: 'assets/img/stories/10.jpg',
    iconFileName: 'assets/img/icons/category_2.png',
    isViewed: false,
  ),
  Story(
    id: 3,
    title: 'حلقات',
    imageFileName: 'assets/img/stories/9.jpg',
    iconFileName: 'assets/img/icons/category_3.png',
    isViewed: false,
  ),
  Story(
    id: 4,
    title: 'اويمة',
    imageFileName: 'assets/img/stories/13.jpg',
    iconFileName: 'assets/img/icons/category_4.png',
    isViewed: false,
  ),
  Story(
    id: 5,
    title: 'اويمة فضي',
    imageFileName: 'assets/img/stories/4.jpg',
    iconFileName: 'assets/img/icons/category_2.png',
    isViewed: false,
  ),
  Story(
    id: 6,
    title: 'حلقات مشجرة',
    imageFileName: 'assets/img/stories/6.jpg',
    iconFileName: 'assets/img/icons/category_1.png',
    isViewed: false,
  ),
  Story(
    id: 7,
    title: 'حلقات كبس ',
    imageFileName: 'assets/img/stories/7.jpg',
    iconFileName: 'assets/img/icons/category_4.png',
    isViewed: false,
  ),
  Story(
    id: 8,
    title: 'استالس',
    imageFileName: 'assets/img/stories/2.jpg',
    iconFileName: 'assets/img/icons/category_3.png',
    isViewed: false,
  ),
];

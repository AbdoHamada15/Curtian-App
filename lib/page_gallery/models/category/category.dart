class Category {
  final int id;
  final String title, imageFileName;

  const Category({
    required this.id,
    required this.title,
    required this.imageFileName,
  });
}

const List<Category> categories = [
  Category(
    id: 1,
    title: 'ستائر استالس',
    imageFileName: 'assets/img/posts/large/1.jpg',
  ),
  Category(
    id: 2,
    title: ' حلقات كبس بيت ستارة',
    imageFileName: 'assets/img/posts/large/2.jpg',
  ),
  Category(
    id: 3,
    title: 'أويمة مربعات ذهبي',
    imageFileName: 'assets/img/posts/large/3.jpg',
  ),
  Category(
    id: 4,
    title: 'حلقات كبس',
    imageFileName: 'assets/img/posts/large/4.jpg',
  ),
  Category(
    id: 5,
    title: 'مواسير حلق',
    imageFileName: 'assets/img/posts/large/5.jpg',
  ),
  Category(
    id: 6,
    title: 'أويمة فضي مربعات',
    imageFileName: 'assets/img/posts/large/6.jpg',
  ),
  Category(
    id: 7,
    title: 'مواسير حلق',
    imageFileName: 'assets/img/posts/large/7.jpg',
  ),
  Category(
    id: 8,
    title: 'أويمة ذهبي مربعات',
    imageFileName: 'assets/img/posts/large/8.jpg',
  ),
];

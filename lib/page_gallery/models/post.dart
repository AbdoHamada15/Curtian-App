class Post {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;

  const Post({
    required this.id,
    required this.caption,
    required this.title,
    required this.likes,
    required this.time,
    required this.isBookmarked,
    required this.imageFileName,
  });
}

const List<Post> posts = [
  Post(
    id: 1,
    title: ' اويمة مربعات فضي مع قطيفة جنزاري  ',
    caption: 'أويمة فضي ',
    isBookmarked: false,
    likes: '3.1k',
    time: '1hr ago',
    imageFileName: 'assets/img/posts/small/4.jpg',
  ),
  Post(
    id: 0,
    title: 'أويمة فرع شجرة ذهبي مع قطيفة بيج',
    caption: ' أويمة ذهبي',
    isBookmarked: false,
    likes: '1.2k',
    time: '2hr ago',
    imageFileName: 'assets/img/posts/small/5.jpg',
  ),
  Post(
    id: 2,
    title: 'ستائر نصفين نص مشجر +نص سادة ',
    caption: 'حلقات كبس ',
    isBookmarked: true,
    likes: '2k',
    time: '41hr ago',
    imageFileName: 'assets/img/posts/small/6.jpg',
  ),
  Post(
    id: 1,
    title: ' اويمة مربعات فضي مع قطيفة جنزاري  ',
    caption: 'أويمة فضي ',
    isBookmarked: false,
    likes: '3.1k',
    time: '1hr ago',
    imageFileName: 'assets/img/posts/small/4.jpg',
  ),
  Post(
    id: 0,
    title: 'أويمة فرع شجرة ذهبي مع قطيفة بيج',
    caption: ' أويمة ذهبي',
    isBookmarked: false,
    likes: '1.2k',
    time: '2hr ago',
    imageFileName: 'assets/img/posts/small/5.jpg',
  ),
  Post(
    id: 2,
    title: 'ستائر نصفين نص مشجر +نص سادة ',
    caption: 'حلقات كبس ',
    isBookmarked: true,
    likes: '2k',
    time: '41hr ago',
    imageFileName: 'assets/img/posts/small/6.jpg',
  ),
  Post(
    id: 1,
    title: ' اويمة مربعات فضي مع قطيفة جنزاري  ',
    caption: 'أويمة فضي ',
    isBookmarked: false,
    likes: '3.1k',
    time: '1hr ago',
    imageFileName: 'assets/img/posts/small/4.jpg',
  ),
  Post(
    id: 0,
    title: 'أويمة فرع شجرة ذهبي مع قطيفة بيج',
    caption: ' أويمة ذهبي',
    isBookmarked: false,
    likes: '1.2k',
    time: '2hr ago',
    imageFileName: 'assets/img/posts/small/5.jpg',
  ),
  Post(
    id: 2,
    title: 'ستائر نصفين نص مشجر +نص سادة ',
    caption: 'حلقات كبس ',
    isBookmarked: true,
    likes: '2k',
    time: '41hr ago',
    imageFileName: 'assets/img/posts/small/6.jpg',
  ),
];

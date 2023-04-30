
//In this dart file, a class Emoji is made to make a list of type Emoji that will contain
//the data to be displayed in the four tabs.Each object of type Emoji will contain two
// attributes: 1)title of the emoji and 2)image of the emoji

class Emoji{
  final String title;
  final String image;

  const Emoji({
    required this.title,
    required this.image
  });
}

final List<Emoji> Emojis = [
  const Emoji(title: 'smile emoji', image: 'assets/smile.jpg'),
  const Emoji(title: 'sad emoji', image: 'assets/sad.jpg'),
  const Emoji(title: 'angry emoji', image: 'assets/angry.jpg'),
  const Emoji(title: 'happy emoji', image: 'assets/happy.jpg'),
];
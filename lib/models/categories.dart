var categories = [
  EventCategory(title: "NightLife", imageUrl: "https://cdn4.vectorstock.com/i/1000x1000/03/78/silhouette-people-dancing-in-night-club-disco-vector-16980378.jpg"),
  EventCategory(title: "Heritage", imageUrl: "http://www.vectorfreak.com/images/preview/taj-mahal-vector-illustration.jpg"),
  EventCategory(title: "Events", imageUrl: "https://i.ytimg.com/vi/jjeKrgFG6gg/hqdefault.jpg",)
];

class EventCategory {
  final String title;
  final String imageUrl;

  EventCategory({this.title, this.imageUrl});
}
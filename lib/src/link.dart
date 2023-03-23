class Link {
  final String title;
  final String description;
  final String url;

  Link({
    required this.title,
    required this.description,
    required this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}

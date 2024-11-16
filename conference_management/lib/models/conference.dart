class Conference {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  Conference({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  factory Conference.fromJson(Map<String, dynamic> json) {
    return Conference(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        );
    }
}
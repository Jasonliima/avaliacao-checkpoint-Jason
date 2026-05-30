class RatingModel {
  RatingModel({
    required this.user,
    required this.stars,
    required this.comment,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  final String user;
  final double stars;
  final String comment;
  final DateTime date;

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      user: json['user'] as String? ?? 'Anônimo',
      stars: (json['stars'] as num?)?.toDouble() ?? 0.0,
      comment: json['comment'] as String? ?? '',
      date: DateTime.tryParse(json['date'] as String? ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'stars': stars,
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }
}

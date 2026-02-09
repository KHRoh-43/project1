class OptionModel {
  final int id;
  final String label;

  OptionModel({required this.id, required this.label});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      label: json['label'],
    );
  }
}

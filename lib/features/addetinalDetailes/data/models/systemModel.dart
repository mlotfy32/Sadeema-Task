class SystemModel {
  final String name;
  final List<dynamic> stages;
  SystemModel({required this.name, required this.stages});
  factory SystemModel.fromJson(data) {
    return SystemModel(name: data['name'], stages: data['stages']);
  }
}

class SystemStages {
  final int id;
  final String stageName;
  final String img;
  final String end_year;
  final int system_id;
  final String created_at;
  final String updated_at;

  SystemStages({
    required this.id,
    required this.stageName,
    required this.img,
    required this.end_year,
    required this.system_id,
    required this.created_at,
    required this.updated_at,
  });
  factory SystemStages.fromJson(data) {
    return SystemStages(
      id: data['id'],
      stageName: data['name'],
      img: data['img'] ?? 'not found',
      end_year: data['end_year'],
      system_id: data['system_id'],
      created_at: data['created_at'],
      updated_at: data['updated_at'],
    );
  }
}

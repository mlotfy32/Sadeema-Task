class ClassesModel {
  final int id;
  final String name;
  final String img;
  final String discount;
  final int system_id;
  final int stage_id;
  final List<dynamic> paths;
  final String created_at;
  final String updated_at;

  ClassesModel({
    required this.id,
    required this.name,
    required this.img,
    required this.discount,
    required this.system_id,
    required this.stage_id,
    required this.paths,
    required this.created_at,
    required this.updated_at,
  });

  factory ClassesModel.fromJson(data) {
    return ClassesModel(
      id: data['id'],
      name: data['name'],
      img: data['img'] ?? 'not found',
      discount: data['discount'] ?? 'not found',
      system_id: data['system_id'],
      paths: data['paths'],
      stage_id: data['stage_id'],
      created_at: data['created_at'],
      updated_at: data['updated_at'],
    );
  }
}

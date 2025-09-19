class TermModel {
  final int id;
  final String name;
  final String img;
  final int price;
  final int term_num;
  final int system_id;
  final int stage_id;
  final int classroom_id;
  final int paths_count;
  final String created_at;
  final String updated_at;

  TermModel({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.term_num,
    required this.system_id,
    required this.stage_id,
    required this.classroom_id,
    required this.paths_count,
    required this.created_at,
    required this.updated_at,
  });

  factory TermModel.fromJson(data) {
    return TermModel(
      id: data['id'],
      name: data['name'],
      img: data['img'] ?? 'not found',
      price: data['price'] ?? 'not found',
      term_num: data['term_num'] ?? 'not found',
      system_id: data['system_id'] ?? 'not found',
      stage_id: data['stage_id'] ?? 'not found',
      classroom_id: data['classroom_id'] ?? 'not found',
      paths_count: data['paths_count'] ?? 'not found',
      created_at: data['created_at'],
      updated_at: data['updated_at'],
    );
  }
}

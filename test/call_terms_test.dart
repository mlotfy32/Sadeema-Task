import 'package:flutter_test/flutter_test.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/termModel.dart';

void main() {
  test('TermModel fromJson should parse correctly', () {
    final json = {
      "id": 1,
      "name": "First Term",
      "classroom_id": 10,
      "created_at": "2024-01-01",
      "updated_at": "2024-01-02",
    };

    final term = TermModel.fromJson(json);

    expect(term.id, 1);
    expect(term.name, "First Term");
    expect(term.classroom_id, 10);
  });

  test('CallTerm should parse response correctly', () async {
    final responseJson = {
      "data": [
        {
          "id": 1,
          "name": "First Term",
          "classroom_id": 10,
          "created_at": "2024-01-01",
          "updated_at": "2024-01-02",
        },
        {
          "id": 2,
          "name": "Second Term",
          "classroom_id": 10,
          "created_at": "2024-01-01",
          "updated_at": "2024-01-02",
        },
      ],
    };

    final terms = (responseJson['data'] as List)
        .map((e) => TermModel.fromJson(e))
        .toList();

    expect(terms.length, 2);
    expect(terms[0].name, "First Term");
    expect(terms[1].name, "Second Term");
  });
}

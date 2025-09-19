import 'package:flutter_test/flutter_test.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/systemModel.dart';

void main() {
  test('SystemModel fromJson should parse correctly', () {
    final json = {
      "name": "Education System 1",
      "stages": [
        {
          "id": 1,
          "name": "Primary",
          "img": "stage1.png",
          "end_year": "2024",
          "system_id": 100,
          "created_at": "2024-01-01",
          "updated_at": "2024-01-02",
        },
        {
          "id": 2,
          "name": "Secondary",
          "img": null,
          "end_year": "2025",
          "system_id": 100,
          "created_at": "2024-01-01",
          "updated_at": "2024-01-02",
        },
      ],
    };

    final system = SystemModel.fromJson(json);

    expect(system.name, "Education System 1");
    expect(system.stages.length, 2);
    expect(system.stages[0].stageName, "Primary");
    expect(system.stages[1].img, "not found");
  });
}

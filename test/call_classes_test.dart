import 'package:flutter_test/flutter_test.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/calling/callClasses.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/classroomsModel.dart';

void main() {
  group("CallClasses.parseClasses", () {
    test("✅ should return list of ClassesModel from valid JSON", () {
      final fakeJson = {
        "data": [
          {"id": 1, "name": "Class A"},
          {"id": 2, "name": "Class B"},
        ],
      };

      final callClasses = CallClasses();

      final result = callClasses.parseClasses(fakeJson);

      expect(result, isA<List<ClassesModel>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].name, "Class A");
      expect(result[1].id, 2);
      expect(result[1].name, "Class B");
    });

    test("✅ should return empty list when data is empty", () {
      final fakeJson = {"data": []};

      final callClasses = CallClasses();
      final result = callClasses.parseClasses(fakeJson);

      expect(result, isEmpty);
    });
  });
}

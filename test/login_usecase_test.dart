import 'package:dartz/dartz.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/features/auth/login/data/models/successLoginModel.dart';
import 'package:test/test.dart';
import 'package:sadeema_task/features/auth/login/domain/login_usecase.dart';
import 'package:sadeema_task/features/auth/login/domain/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<Either<Failure, SuccessLoginModel>> login(
    String email,
    String password,
  ) async {
    if (email == "test@mail.com" && password == "12345678") {
      final model = SuccessLoginModel(
        token: "dummy_token",
        id: 1,
        name: "Test User",
        email: "test@mail.com",
        phone: "0123456789",
        phone_verified: 1,
        country_code: "+20",
        type: "parent",
        gendar: "male",
        img: "img_url",
        institution_id: "inst_1",
        noti_id: "notification_token_123",
        social_id: "social_123",
        username: "testuser",
        noti_mark_exam: "1",
        noti_reupload_exam: "1",
        noti_noti_lesson_finishid: "1",
        noti_login: "1",
        noti_session_time: "1",
        noti_locreated_atgin: "2025-09-19",
        updated_at: "2025-09-19",
      );
      return Right(model);
    } else {
      return Left(ServerFailure('Invalid credentials'));
    }
  }
}

void main() {
  group("LoginUseCase Tests", () {
    late LoginUseCase usecase;

    setUp(() {
      usecase = LoginUseCase(FakeAuthRepository());
    });

    test("✅ should return SuccessLoginModel when login succeeds", () async {
      final result = await usecase.callEmailAuth("test@mail.com", "12345678");

      expect(result.isRight(), true);

      result.fold((_) => fail("Expected success, got failure"), (model) {
        expect(model, isA<SuccessLoginModel>());
        expect(model.email, equals("test@mail.com"));
        expect(model.noti_id, equals("notification_token_123"));
        expect(model.type, equals("parent"));
      });
    });

    test("❌ should return Failure when login fails", () async {
      final result = await usecase.callEmailAuth(
        "wrong@mail.com",
        "wrongpassword",
      );

      expect(result.isLeft(), true);

      result.fold(
        (failure) => expect(failure.message, equals("Invalid credentials")),
        (_) => fail("Expected failure, got success"),
      );
    });
  });
}

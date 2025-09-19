class UserEntity {
  final String email_or_phone;
  final String password;
  final String type;
  final String noti_id;
  final String mobile_id;
  final String mobile_type;

  UserEntity({
    required this.email_or_phone,
    required this.password,
    required this.type,
    required this.noti_id,
    required this.mobile_id,
    required this.mobile_type,
  });
}

class SuccessLoginModel {
  final String token;
  final int id;
  final String name;
  final String email;
  final String phone;
  final int phone_verified;
  final String country_code;
  final String type;
  final String gendar;
  final String img;
  final String institution_id;
  final String noti_id;
  final String social_id;
  final String username;
  final String noti_mark_exam;
  final String noti_reupload_exam;
  final String noti_noti_lesson_finishid;
  final String noti_login;
  final String noti_session_time;
  final String noti_locreated_atgin;
  final String updated_at;

  SuccessLoginModel({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.phone_verified,
    required this.country_code,
    required this.type,
    required this.gendar,
    required this.img,
    required this.institution_id,
    required this.noti_id,
    required this.social_id,
    required this.username,
    required this.noti_mark_exam,
    required this.noti_reupload_exam,
    required this.noti_noti_lesson_finishid,
    required this.noti_login,
    required this.noti_session_time,
    required this.noti_locreated_atgin,
    required this.updated_at,
  });
  factory SuccessLoginModel.fromJson(data) {
    return SuccessLoginModel(
      token: data['token'] ?? 'not found',
      id: data['login_data']['id'] ?? 'not found',
      name: data['login_data']['name'] ?? 'not found',
      email: data['login_data']['email'] ?? 'not found',
      phone: data['login_data']['phone'] ?? 'not found',
      phone_verified: data['login_data']['phone_verified'] ?? 'not found',
      country_code: data['login_data']['country_code'],
      type: data['login_data']['type'] ?? 'not found',
      gendar: data['login_data']['gendar'] ?? 'not found',
      img: data['login_data']['img'] ?? 'not found',
      institution_id: data['login_data']['institution_id'] ?? 'not found',
      noti_id: data['login_data']['noti_id'],
      social_id: data['login_data']['social_id'] ?? 'not found',
      username: data['login_data']['username'] ?? 'not found',
      noti_mark_exam: data['login_data']['noti_mark_exam'] ?? 'not found',
      noti_reupload_exam:
          data['login_data']['noti_reupload_exam'] ?? 'not found',
      noti_noti_lesson_finishid:
          data['login_data']['noti_noti_lesson_finishid'] ?? 'not found',
      noti_login: data['login_data']['noti_login'] ?? 'not found',
      noti_session_time: data['login_data']['noti_session_time'],
      noti_locreated_atgin:
          data['login_data']['noti_locreated_atgin'] ?? 'not found',
      updated_at: data['login_data']['updated_at'] ?? 'not found',
    );
  }
}

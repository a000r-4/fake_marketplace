import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_entity.freezed.dart';
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    String? email,
    String? phoneNumber,
    required bool isEmailVerified,
    required bool isPhoneVerified,
    String? displayName,
    String? photoUrl,
    required DateTime createdAt,
  }) = _UserEntity;
}
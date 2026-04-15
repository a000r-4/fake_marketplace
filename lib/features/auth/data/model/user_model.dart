import 'package:auth_template/features/auth/domain/entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    String? email,
    String? phoneNumber,
    required bool isEmailVerified,
    required bool isPhoneVerified,
    String? displayName,
    String? photoUrl,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      email: user.email,
      phoneNumber: user.phoneNumber,
      isEmailVerified: user.emailVerified,
      isPhoneVerified: user.phoneNumber != null,
      displayName: user.displayName,
      photoUrl: user.photoURL,
      createdAt:
      user.metadata.creationTime ?? DateTime.now(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      phoneNumber: phoneNumber,
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      displayName: displayName,
      photoUrl: photoUrl,
      createdAt: createdAt,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      isEmailVerified: entity.isEmailVerified,
      isPhoneVerified: entity.isPhoneVerified,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
      createdAt: entity.createdAt,
    );
  }
}
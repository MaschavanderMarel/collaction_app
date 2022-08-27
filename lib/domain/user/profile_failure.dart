import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_failure.freezed.dart';

@freezed
class ProfileFailure with _$ProfileFailure {
  const factory ProfileFailure.unexpected() = Unexpected;
  const factory ProfileFailure.noUser() = NoUser;
  const factory ProfileFailure.errorFetchingParticipants() =
      ErrorFetchingParticipants;
}

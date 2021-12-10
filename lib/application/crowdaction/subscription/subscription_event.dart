part of 'subscription_bloc.dart';

@freezed
class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.participate(CrowdAction action) =
      _Participate;

  const factory SubscriptionEvent.withdrawParticipation(CrowdAction action) =
      _WithdrawParticipation;
}

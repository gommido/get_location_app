part of 'get_location_cubit.dart';

@immutable
abstract class GetLocationState {}

class GetLocationInitial extends GetLocationState {}


class LocationLoading extends GetLocationState {

}
class LocationSuccess extends GetLocationState {

}
class LocationFail extends GetLocationState {
  final String error;
  LocationFail(this.error);
}

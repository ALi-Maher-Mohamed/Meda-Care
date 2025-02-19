part of 'pharmacy_cubit.dart';

@immutable
abstract class PharmacyState {}

class PharmacyInitial extends PharmacyState {}

class PharmacyLoading extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  final List<PharmacyModel> pharmacies;

  PharmacyLoaded(this.pharmacies);
}

class PharmacyError extends PharmacyState {
  final String message;

  PharmacyError(this.message);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'organizations_cubit.dart';

enum OrganizationsStatus { initial, loading, success, failure }

class OrganizationsState extends Equatable {
  const OrganizationsState({
    this.status = OrganizationsStatus.initial,
    this.organizaciones = const <Organizacion>[],
  });

  final OrganizationsStatus status;
  final List<Organizacion> organizaciones;

  @override
  List<Object> get props => [status, organizaciones];

  OrganizationsState copyWith({
    OrganizationsStatus? status,
    List<Organizacion>? organizaciones,
  }) {
    return OrganizationsState(
      status: status ?? this.status,
      organizaciones: organizaciones ?? this.organizaciones,
    );
  }
}

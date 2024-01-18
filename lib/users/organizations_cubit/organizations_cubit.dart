import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_mamagement_challenge/users/user_model.dart';

part 'organizations_state.dart';

class OrganizationsCubit extends Cubit<OrganizationsState> {
  OrganizationsCubit() : super(const OrganizationsState());

  static const String _authority =
      "us-central1-transforma-tu-actitud.cloudfunctions.net";
  // static const String _endpointCategorie = "/eventcategories";
  static const String _endpointOrganization = "/organization";

  void cargarOrganizaciones() async {
    emit(state.copyWith(status: OrganizationsStatus.loading));

    // final Uri uri = Uri.https(_authority, _endpointOrganization);
    // final response = await http.get(uri);
    // if (response.statusCode == 200) {
    //   final jsonData = json.decode(response.body);
    //   final users = jsonData["result"] as List<dynamic>;
    //   // print(users);
    //   final organizations = List.generate(
    //       users.length,
    //       (index) =>
    //           Organizacion.fromMap(users[index] as Map<String, dynamic>));
    await Future.delayed(const Duration(seconds: 2));
    final organizations = [
      Organizacion(name: "La 1", email: "email@gmail.com")
    ];

    emit(state.copyWith(
        status: OrganizationsStatus.success, organizaciones: organizations));
    // } else {
    //   emit(const OrganizationsState(status: OrganizationsStatus.failure));
    // }
  }

  // /// Subtract 1 from the current state.
  void borrarOrganizaciones() =>
      emit(const OrganizationsState(status: OrganizationsStatus.initial));
}

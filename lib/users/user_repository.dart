import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_mamagement_challenge/users/user_model.dart';

class OrganizationRepository {
  OrganizationRepository();

  static const String _authority =
      "us-central1-transforma-tu-actitud.cloudfunctions.net";
  // static const String _endpointCategorie = "/eventcategories";
  static const String _endpointOrganization = "/organization";

  Future<List<Organizacion>> getOrganizations() async {
    final Uri uri = Uri.https(_authority, _endpointOrganization);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final users = jsonData["result"] as List<dynamic>;
      // print(users);
      final userModels = List.generate(
          users.length,
          (index) =>
              Organizacion.fromMap(users[index] as Map<String, dynamic>));
      return userModels;
    } else {
      throw Exception("Failed to load Data");
    }
  }
}

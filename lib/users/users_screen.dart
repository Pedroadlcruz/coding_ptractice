import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mamagement_challenge/users/organizations_cubit/organizations_cubit.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrganizationsCubit, OrganizationsState>(
        builder: (context, state) {
          switch (state.status) {
            case OrganizationsStatus.initial:
              return const Center(
                child: Text('No teemos organizaciones'),
              );
            case OrganizationsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case OrganizationsStatus.failure:
              return const Center(
                child: Text('Erroorrrr'),
              );
            case OrganizationsStatus.success:
              return ListView.builder(
                itemCount: state.organizaciones.length,
                itemBuilder: (context, index) {
                  final user = state.organizaciones[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            default:
              return const Center(
                child: Text('Algo anda mal'),
              );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Get Categorías"),
          FloatingActionButton(
            onPressed: () {
              context.read<OrganizationsCubit>().cargarOrganizaciones();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          const Text("Borrar Categorías"),
          FloatingActionButton(
            onPressed: () {
              context.read<OrganizationsCubit>().borrarOrganizaciones();
            },
            child: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}

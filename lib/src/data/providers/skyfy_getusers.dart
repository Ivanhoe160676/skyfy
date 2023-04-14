import 'package:flutter/material.dart';
import 'package:skyfy/src/data/services/firebase_services.dart';

//! Retorma la lista de Usuarios
class FutureGet extends StatelessWidget {
  const FutureGet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index]['username'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(snapshot.data?[index]['email']),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

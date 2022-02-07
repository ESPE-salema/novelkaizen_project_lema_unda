import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/novela_card.dart';

import 'novela_form_widget.dart';

class NovelaFirebaseWidget extends StatefulWidget {
  const NovelaFirebaseWidget({Key? key}) : super(key: key);

  @override
  State<NovelaFirebaseWidget> createState() => _NovelaFirebaseWidgetState();
}

class _NovelaFirebaseWidgetState extends State<NovelaFirebaseWidget> {
  final Stream<QuerySnapshot> _novelasRef =
      FirebaseFirestore.instance.collection('novelas').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _novelasRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Un error ha ocurrido"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox.square(
                  dimension: 50.0, child: CircularProgressIndicator()));
        }

        return Scaffold(
            body: snapshot.data == null
                ? const Center(
                    child: SizedBox.square(
                        dimension: 50.0, child: CircularProgressIndicator()))
                : snapshot.data!.docs.isEmpty
                    ? const Center(child: Text("No hay novelas que mostrar"))
                    : GridView.count(
                        childAspectRatio: 0.6,
                        crossAxisCount: 2,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          Novela model = Novela.fromJson(data);

                          return NovelaCard(model: model);
                        }).toList(),
                      ),
            floatingActionButton: FloatingActionButton(
              elevation: 4,
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const NovelaFormWidget(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}

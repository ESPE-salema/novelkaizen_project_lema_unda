import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';
import 'package:novelkaizen_project_lema_unda/src/services/novela_service.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/novela_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NovelaService _novelaService = NovelaService();
  List<Novela>? _novelas;

  @override
  void initState() {
    super.initState();
    _downloadNovelas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("KAIZEN NOVEL")),
        body: _novelas == null
            ? const Center(
                child: SizedBox.square(
                    dimension: 50.0, child: CircularProgressIndicator()))
            : _novelas!.isEmpty
                ? const Center(child: Text("No hay novelas que mostrar"))
                : ListView(
                    children:
                        _novelas!.map((e) => NovelaWidget(model: e)).toList(),
                  ));
  }

  _downloadNovelas() async {
    _novelas = await _novelaService.getNovelas();
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';
import 'package:novelkaizen_project_lema_unda/src/services/novela_service.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/novela_card.dart';

class NovelaWidget extends StatefulWidget {
  const NovelaWidget({Key? key}) : super(key: key);

  @override
  State<NovelaWidget> createState() => _NovelasWidgetState();
}

class _NovelasWidgetState extends State<NovelaWidget> {
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
        body: _novelas == null
            ? const Center(
                child: SizedBox.square(
                    dimension: 50.0, child: CircularProgressIndicator()))
            : _novelas!.isEmpty
                ? const Center(child: Text("No hay novelas que mostrar"))
                : ListView(
                    children:
                        _novelas!.map((e) => NovelaCard(model: e)).toList(),
                  ));
  }

  _downloadNovelas() async {
    _novelas = await _novelaService.getNovelas();
    setState(() {});
  }
}

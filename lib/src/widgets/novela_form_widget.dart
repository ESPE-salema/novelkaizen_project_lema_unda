import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';
import 'package:novelkaizen_project_lema_unda/src/services/novela_service.dart';
import 'package:novelkaizen_project_lema_unda/src/utils/validation.dart';

class NovelaFormWidget extends StatefulWidget {
  const NovelaFormWidget({Key? key}) : super(key: key);

  @override
  _NovelaFormWidgetState createState() => _NovelaFormWidgetState();
}

class _NovelaFormWidgetState extends State<NovelaFormWidget> {
  late Novela _novela;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  bool _onSaving = false;
  final NovelaService _novelaService = NovelaService();

  @override
  void initState() {
    super.initState();
    setState(() {
      _novela = Novela();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Agregar novela")),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorDark,
              ])),
            ),
            Column(
              children: [
                SizedBox.square(dimension: 10.h),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 14.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColorDark)),
                  child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 8.0),
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Ingresar la portada",
                                  style:
                                      Theme.of(context).textTheme.subtitle1)),
                          SizedBox(
                              height: 100.h,
                              width: 150.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _imagen == null
                                    ? Image.asset(
                                        'assets/images/default-image.jpg')
                                    : Image.file(_imagen!),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () =>
                                      _selectImage(ImageSource.camera),
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text("Cámara")),
                              ElevatedButton.icon(
                                  onPressed: () =>
                                      _selectImage(ImageSource.gallery),
                                  icon: const Icon(Icons.image_search),
                                  label: const Text("Galería")),
                            ],
                          ),
                          TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: _novela.titulo,
                              onSaved: (value) {
                                //Este evento se ejecuta cuando el Form ha sido guardado localmente
                                _novela.titulo =
                                    value; //Asigna el valor del TextFormField al atributo del modelo
                              },
                              validator: (value) {
                                return validateString(value!);
                              },
                              decoration:
                                  const InputDecoration(labelText: "Titulo"),
                              maxLength: 50,
                              maxLines: 1),
                          TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: _novela.autor,
                              onSaved: (value) {
                                //Este evento se ejecuta cuando el Form ha sido guardado localmente
                                _novela.autor =
                                    value; //Asigna el valor del TextFormField al atributo del modelo
                              },
                              validator: (value) {
                                return validateString(value!);
                              },
                              decoration:
                                  const InputDecoration(labelText: "Autor"),
                              maxLength: 50,
                              maxLines: 1),
                          TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: _novela.descripcion,
                              onSaved: (value) {
                                //Este evento se ejecuta cuando el Form ha sido guardado localmente
                                _novela.descripcion =
                                    value; //Asigna el valor del TextFormField al atributo del modelo
                              },
                              validator: (value) {
                                return validateString(value!);
                              },
                              decoration: const InputDecoration(
                                  labelText: "Decripción"),
                              maxLength: 255,
                              maxLines: 2),
                          Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Text("Ingresar la fecha",
                                  style:
                                      Theme.of(context).textTheme.subtitle1)),
                          DatePickerWidget(
                              lastDate: DateTime.now(),
                              looping: false, // default is not looping
                              dateFormat: "dd-MMMM-yyyy",
                              locale: DatePicker.localeFromString('es'),
                              onChange: (DateTime newDate, _) {
                                _novela.fechaCreacion = newDate.toString();
                              }),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: _onSaving
                                  ? const CircularProgressIndicator()
                                  : Tooltip(
                                      message: "Registrar novela",
                                      child: ElevatedButton.icon(
                                          onPressed: () {
                                            _sendForm();
                                          },
                                          label: const Text("Guardar"),
                                          icon: const Icon(Icons.save)),
                                    ))
                        ]),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _selectImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
      //print('No image selected.');
    }
    setState(() {});
  }

  _sendForm() async {
    if (!_formKey.currentState!.validate()) return;

    _onSaving = true;
    setState(() {});

    _formKey.currentState!.save(); //Guarda el form localmente

    if (_imagen != null) {
      _novela.portada = await _novelaService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Portada
    int estado = await _novelaService.postNovela(_novela);
    if (estado == 201) {
      _formKey.currentState!.reset();
      _onSaving = false;
      Navigator.pop(context);
    }
  }
}

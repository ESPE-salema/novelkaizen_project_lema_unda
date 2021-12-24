import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/biblioteca_widget.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/descubrir_widget.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/genero_widget.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/novela_widget.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/yo_widget.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.filter_none, "Género"),
  ItemMenu(Icons.explore, "Descubrir"),
  ItemMenu(Icons.book, "Biblioteca"),
  ItemMenu(Icons.account_circle, "Yo"),
];

List<Widget> homeWidgets = [
  const NovelaWidget(),
  const GeneroWidget(),
  const DescubrirWidget(),
  const BibliotecaWidget(),
  const YoWidget(),
];

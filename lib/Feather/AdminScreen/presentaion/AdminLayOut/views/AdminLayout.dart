import 'package:flutter/material.dart';

class AdminLyOut extends StatelessWidget {
  const AdminLyOut({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.reorder_outlined),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isCollaped = false;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

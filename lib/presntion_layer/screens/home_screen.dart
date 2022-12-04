import 'package:flutter/material.dart';
import 'package:pure_soft_database/presntion_layer/screens/add_section_screen.dart';
import 'package:pure_soft_database/size_config.dart';

import '../widgets/grid_view.dart';
import '../widgets/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الرئيسية',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddSectionScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
            child: Column(
              children: [
                const ImageSlider(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const GridViewWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

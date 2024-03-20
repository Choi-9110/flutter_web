import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wish_members/constants/skill_items.dart';
import 'package:wish_members/widgets/main_desktop.dart';

import '../constants/colors.dart';
import '../constants/size.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';
import '../widgets/main_mobile.dart';
import '../widgets/skills_desktop.dart';
import '../widgets/skills_mobile.dart';

class HmoePage extends StatefulWidget {
  const HmoePage({super.key});

  @override
  State<HmoePage> createState() => _HmoePageState();
}

class _HmoePageState extends State<HmoePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= 600.0 ? null : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // MAIN
            // 잠깐 주석처리하고 다음꺼 만들예정
            if (constraints.maxWidth >= kMinDesktopWidth)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            if (constraints.maxWidth >= kMinDesktopWidth)
              const MainDesktop()
            else
              const MainMobile(),

            // SKILLS
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: CustomColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  const Text(
                    "What tdddhe F ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  if (constraints.maxWidth >= kMedDesktopWidth)
                    const SkillsDesktop()
                  else
                    const SkillsMobile()
                ],
              ),
            ),

//PRJ
          ],
        ),
      );
    });
  }
}

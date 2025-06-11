import 'package:altfit/controller/home_controller.dart';
import 'package:altfit/routes/routes.dart';
import 'package:altfit/utils/widgets/plan_widget.dart';
import 'package:altfit/utils/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation){
        final isPortrait = orientation == Orientation.portrait;
   return   Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          centerTitle: false,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset("assets/logo.png"),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
                "ALTFIT",
                style: theme.textTheme.displayMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800
                ),
              ),
          ),
          actionsPadding: EdgeInsets.only(top: 10),
          actions: [
            Obx(()=>IconButton(onPressed: controller.toggleTheme, icon: controller.isDarkMode.value?Icon(Icons.dark_mode, color: Colors.white,): Icon(Icons.light_mode, color: Colors.black,)))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTargetCard(orientation == Orientation.portrait),
                  Space(
                    height: 32,
                  ),
                  ElevatedButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.myPlans
                          );
                        },
                        style: theme.elevatedButtonTheme.style!.copyWith(
                            minimumSize: WidgetStateProperty.all<Size>(Size(width, 48)),
                        ),
                        child: Text(
                          "Tap to see your plans",
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.white
                          ),
                        ),
                      ),
                  Space(height: 32),
                  Row(
                    children: [
                      Text(
                        "Workout Plans",
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {
                          Get.toNamed(Routes.explore);
                        },
                        style: theme.elevatedButtonTheme.style!.copyWith(
                            minimumSize: WidgetStateProperty.all<Size>(Size(100, 48)),
                            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 16)),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                        ),
                        child: Text(
                          "Explore more",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                  Space(height: 20),
                  
                  Obx(() =>
                    controller.programs.isNotEmpty
                        ? SizedBox(
                            width: width,
                            height: isPortrait? height/2 : height*2,
                            child: _buildSwiper(orientation == Orientation.portrait),
                          )
                        : SizedBox(
                            height: 100,
                            child: Text("No programs available"),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      );}
    );
  }

  _buildTargetCard(bool isPortrait) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio:isPortrait? 3/2 : 7/2,
      child: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("assets/challanger.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color(0xFF313BC9).withAlpha(120), 
              BlendMode.srcATop,
            ),
          ),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(255, 79, 221, 126),
              blurRadius: 4,
              offset: Offset(-1, 2),
            ),
            const BoxShadow(
              color: Color.fromARGB(255, 247, 70, 244),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Challange",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Space(height: 20),
            IntrinsicHeight(
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/fire.png", height: 72, width: 72),
                      Space(height: 8),
                      Text(
                        "1.2k",
                        style: theme.textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Space(height: 2),
                      Text(
                        "calories",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/kettlebell.png",
                        height: 72,
                        width: 80,
                      ),
                      Space(height: 8),
                      Text(
                        "3hr",
                        style: theme.textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Space(height: 2),
                      Text(
                        "workout",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/running.png", height: 72, width: 72),
                      Space(height: 8),
                      Text(
                        "2k",
                        style: theme.textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Space(height: 2),
                      Text(
                        "steps",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSwiper(bool isPortrait){
      return Obx(()=>CardSwiper(
            cardsCount: controller.programs.length,
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) => PlanWidget(program: controller.programs[index], mainview: true, context: context, isPortrait: isPortrait,)
          ),
      );
  }
}

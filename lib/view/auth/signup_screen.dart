import 'package:altfit/controller/signup_controller.dart';
import 'package:altfit/routes/routes.dart';
import 'package:altfit/utils/widgets/RPS_custom_painter.dart';
import 'package:altfit/utils/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final controller = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: _buildPortrait(context, orientation),
          ),
        );
      },
    );
  }

  Widget _buildPortrait(BuildContext context, Orientation orientation) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: RPSCustomClipper(width: width),
                    child: Image.asset(
                      "assets/auth.png",
                      width: width,
                      height: width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: height * 0.025,
                    left: width * 0.05,
                    child: Text(
                      "ALTFIT",
                      style: theme.textTheme.displayMedium!.copyWith(
                        fontStyle: FontStyle.italic,
                        color: theme.colorScheme.onSurface,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: const Color.fromARGB(64, 23, 0, 0),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: width / 1.2,
                    left: width * 0.05,
                    child: Text("Signup", style: theme.textTheme.displayMedium),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child:_buildSignUpForm(height, width, theme)
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpForm(double height, double width, ThemeData theme) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Space(height: 48,),
              TextFormField(
                controller: email,
      
                 style: theme.textTheme.bodyMedium!.copyWith(
           color: Colors.black,
           fontSize: 16
        ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "email",
      
                  filled: true,
                  fillColor: theme.inputDecorationTheme.fillColor,
                  border: theme.inputDecorationTheme.border,
                  enabledBorder: theme.inputDecorationTheme.enabledBorder,
                  focusedBorder: theme.inputDecorationTheme.focusedBorder,
                  hintStyle: theme.inputDecorationTheme.hintStyle!.copyWith(
          fontSize: 16,
        ),
                ),
              ),
              Space(height: 32,),
              Obx(
               ()=> TextFormField(
                controller: password,
                obscureText:  controller.obscureText.value,
                 style: theme.textTheme.bodyMedium!.copyWith(
           color: Colors.black,
           fontSize: 16,
        ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                   suffixIcon:Obx(()=> IconButton(onPressed: (){
                    controller.obscureText.value = !controller.obscureText.value;
                   }, icon:  controller.obscureText.value ? Icon(Icons.remove_red_eye):Icon(Icons.password_outlined, ),)),
                  hintText: "password",
                  filled: true,
                  fillColor: theme.inputDecorationTheme.fillColor,
                  border: theme.inputDecorationTheme.border,
                  enabledBorder: theme.inputDecorationTheme.enabledBorder,
                  focusedBorder: theme.inputDecorationTheme.focusedBorder,
                  hintStyle: theme.inputDecorationTheme.hintStyle!.copyWith(
          fontSize: 16,
        ),
                ),
              ),),
              Space(height: 32,),
              RichText(
                text: TextSpan(
                text: "Already have account? ",
                style: theme.textTheme.bodyMedium,
                children: [
                  WidgetSpan(
                  child: TextButton(
                    onPressed: () {
                    Get.offNamed(Routes.login);
                    },
                    style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                    "Login",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  ),
                ],
                ),
              ),
            Spacer(), 
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton.filled(
                  onPressed: ()=>controller.handleSignup(email: email.text, password: password.text),
                  icon: Icon(Icons.arrow_forward_rounded, size: 48,),
                ),
              ),
            ],
          ),
        ),
     
    );
  }
}

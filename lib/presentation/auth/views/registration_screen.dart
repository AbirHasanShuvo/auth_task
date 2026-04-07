import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textformfield.dart';
import '../../../theme/app_text_styles.dart';
import '../widgets/welcome_text.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            welcomeText('Hello there', 30, 20),
            welcomeText('Sign up to get started', 20, 20),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          prefixIcon: Icon(Icons.person),
                          hint: "Name",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          prefixIcon: Icon(Icons.email),
                          hint: "Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),

                        CustomTextFormField(
                          prefixIcon: Icon(Icons.lock),
                          hint: "Password",
                          keyboardType: TextInputType.emailAddress,
                          isPassword: true,
                        ),

                        const SizedBox(height: 20),

                        CustomButton(
                          text: "Sign Up",
                          onTap: () {},
                          borderRadius: 10,
                        ),

                        const SizedBox(height: 10),
                        Text(
                          'Are you registered ? ',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: "Sign In",
                          onTap: () {
                            context.pushNamed('/login');
                          },
                          borderRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

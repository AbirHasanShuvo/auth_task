// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../shared/widgets/custom_button.dart';
// import '../../../shared/widgets/custom_textformfield.dart';
// import '../../../theme/app_text_styles.dart';
// import '../provider/auth_provider.dart';
// import '../widgets/welcome_text.dart';
//
// class LoginScreen extends ConsumerWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _formKey = GlobalKey<FormState>();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: SafeArea(
//         bottom: false,
//         child: Column(
//           children: [
//             welcomeText('Welcome', 30, 20),
//             welcomeText('Login Here', 20, 20),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.2),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade400,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(150),
//                   ),
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CustomTextFormField(
//                           prefixIcon: Icon(Icons.email),
//                           hint: "Email",
//                           controller: emailController,
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Email is required";
//                             }
//                             if (!value.contains("@")) {
//                               return "Enter a valid email";
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 10),
//
//                         CustomTextFormField(
//                           prefixIcon: Icon(Icons.lock),
//                           hint: "Password",
//                           controller: passwordController,
//                           keyboardType: TextInputType.emailAddress,
//                           isPassword: true,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Email is required";
//                             }
//                             if (value.length < 8) {
//                               return "Password should be minimum 8";
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 5),
//
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Text(
//                             'Forgot Password?',
//                             style: AppTextStyles.caption,
//                           ),
//                         ),
//
//                         const SizedBox(height: 15),
//
//                         CustomButton(
//                           text: "Sign In",
//                           onTap: () async {
//                             await ref
//                                 .read(authProvider.notifier)
//                                 .login(
//                                   emailController.text,
//                                   passwordController.text,
//                                 );
//                           },
//                           borderRadius: 10,
//                         ),
//
//                         const SizedBox(height: 10),
//                         Text(
//                           'Are you not registered ? ',
//                           style: GoogleFonts.roboto(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         CustomButton(
//                           text: "Sign Up",
//                           onTap: () {
//                             context.pushNamed('/registration');
//                           },
//                           borderRadius: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//updated code

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textformfield.dart';
import '../../../theme/app_text_styles.dart';
import '../data/user_model.dart';
import '../provider/auth_provider.dart';
import '../widgets/welcome_text.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            welcomeText('Welcome', 30, 20),
            welcomeText('Login Here', 20, 20),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(150),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// EMAIL
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.email),
                          hint: "Email",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }

                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );

                            if (!emailRegex.hasMatch(value)) {
                              return "Enter a valid email";
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.lock),
                          hint: "Password",
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.caption,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // CustomButton(
                        //   text: "Sign In",
                        //   onTap: () async {
                        //     if (_formKey.currentState!.validate()) {
                        //       await ref
                        //           .read(authProvider.notifier)
                        //           .login(
                        //             emailController.text.trim(),
                        //             passwordController.text.trim(),
                        //           );
                        //     }
                        //   },
                        //   borderRadius: 10,
                        // ),
                        CustomButton(
                          text: "Sign In",
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final authNotifier = ref.read(
                                authProvider.notifier,
                              );

                              try {
                                await authNotifier.login(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );

                                final userState = ref.read(authProvider);

                                userState.when(
                                  data: (user) {
                                    if (user != null) {
                                      context.go(
                                        '/home',
                                      ); // Navigate on success
                                    }
                                  },
                                  loading: () {}, // no-op
                                  error: (error, stack) {
                                    // Show the exact error message from API
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(error.toString())),
                                    );
                                  },
                                );
                              } catch (e) {
                                // Fallback error
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())),
                                );
                              }
                            }
                          },
                          borderRadius: 10,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Are you not registered?',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            context.pushNamed('/registration');
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

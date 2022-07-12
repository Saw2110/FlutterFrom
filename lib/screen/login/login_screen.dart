import 'package:customstuff/widgets/text_field_decoration.dart';
import 'package:customstuff/widgets/text_field_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketing/constant/assets_list.dart';
import 'package:marketing/constant/colors.dart';
import 'package:marketing/constant/fonts.dart';
import 'package:marketing/state/login_state.dart';
import 'package:marketing/widget/about_elite.dart';
import 'package:marketing/widget/custom_shape.dart';
import 'package:marketing/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LoginState>(context, listen: false).init();
    Provider.of<LoginState>(context, listen: false).getContext = context;
  }

  onBack() async {
    SystemNavigator.pop(animated: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onBack();
      },
      child: Consumer<LoginState>(
        builder: (context, state, child) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: const AboutEasySoft(),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 150,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  flexibleSpace: ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: primaryColor),
                  ),
                ),
                body: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30.0),
                  children: [
                    /// Cooperative Name
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Easy Software Pvt. Ltd",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kTitleText.copyWith(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    /// Login User Name and Password
                    // const SizedBox(height: 5.0),
                    // TextFieldFormat(
                    //   textFieldName: 'Cooperative Id',
                    //   textFormField: Form(
                    //     key: state.cooperativeKey,
                    //     child: TextFormField(
                    //       onChanged: (text) {
                    //         if (text.isNotEmpty) {
                    //           state.cooperativeKey.currentState!.validate();
                    //         }
                    //       },
                    //       validator: (value) {
                    //         if (value!.isEmpty) {
                    //           return 'Please enter password';
                    //         } else {
                    //           return null;
                    //         }
                    //       },
                    //       controller: state.cooperativeController,
                    //       decoration: TextFormDecoration.decoration(
                    //         hintText: "Enter Cooperative Id",
                    //         primaryColor: primaryColor,
                    //         borderColor: Colors.white,
                    //         icon: Icons.home,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 5.0),

                    TextFieldFormat(
                      textFieldName: 'Username',
                      textFormField: Form(
                        key: state.usernameFormKey,
                        child: TextFormField(
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              state.usernameFormKey.currentState!.validate();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            } else {
                              return null;
                            }
                          },
                          controller: state.userController,
                          // keyboardType: TextInputType.number,
                          // maxLines: 1,
                          // maxLength: 10,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          decoration: TextFormDecoration.decoration(
                            hintText: "Enter username",
                            primaryColor: primaryColor,
                            borderColor: Colors.white,
                            icon: Icons.person,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),

                    TextFieldFormat(
                      textFieldName: 'Password',
                      textFormField: Form(
                        key: state.passwordFormKey,
                        child: TextFormField(
                          obscureText: !state.isPasswordVisibility,
                          obscuringCharacter: "x",
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              state.passwordFormKey.currentState!.validate();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else {
                              return null;
                            }
                          },
                          controller: state.passController,
                          decoration: TextFormDecoration.decoration(
                            hintText: "Enter password",
                            primaryColor: primaryColor,
                            borderColor: Colors.white,
                            icon: Icons.password,
                          ).copyWith(
                            suffixIcon: state.isPasswordVisibility == true
                                ? IconButton(
                                    icon: const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Colors.red),
                                    onPressed: () {
                                      state.getPasswordVisibility = false;
                                    })
                                : IconButton(
                                    icon: Icon(Icons.visibility_outlined,
                                        color: primaryColor),
                                    onPressed: () {
                                      state.getPasswordVisibility = true;
                                    }),
                          ),
                        ),
                      ),
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(children: [
                              Checkbox(
                                  value: state.isRemember,
                                  activeColor: primaryColor,
                                  onChanged: (value) {
                                    state.getRemember = value!;
                                  }),
                              Flexible(
                                  child: Text("Remember me", style: kTitleText))
                            ]),
                          ),
                        ]),
                    const SizedBox(height: 5.0),

                    /// Button Section
                    ElevatedButton(
                      onPressed: () {
                        state.onLogin();
                      },
                      child: const Text("LOGIN"),
                    ),
                  ],
                ),
              ),

              /// Cooperative Logo
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: primaryColor,
                    child: CircleAvatar(
                      radius: 58.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          AssetsList.appCircleIcon,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (state.isLoading) LoadingScreen.loadingScreen(),
            ],
          );
        },
      ),
    );
  }
}

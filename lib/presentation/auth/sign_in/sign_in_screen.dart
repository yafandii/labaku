import 'dart:io';

import 'package:boilerplate/data/constant/app_assets.dart';
import 'package:boilerplate/data/constant/app_color.dart';
import 'package:boilerplate/data/constant/app_font.dart';
import 'package:boilerplate/injection.dart';
import 'package:boilerplate/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:boilerplate/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:boilerplate/presentation/auth/sign_up/widget/item_social_media.dart';
import 'package:boilerplate/presentation/home.dart/home_screen.dart';
import 'package:boilerplate/presentation/widgets/button/back_button.dart';
import 'package:boilerplate/presentation/widgets/button/base_button.dart';
import 'package:boilerplate/presentation/widgets/check_box/check_box_with_text.dart';
import 'package:boilerplate/presentation/widgets/field/base_text_input.dart';
import 'package:boilerplate/presentation/widgets/field/password_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode focusNode = FocusNode();
  late SignUpBloc signUpBloc;
  @override
  void initState() {
    super.initState();
    signUpBloc = getIt<SignUpBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              sectionHeader(),
              const SizedBox(height: 32),
              sectionFormSignIn(),
              const SizedBox(height: 32),
              sectionDivider(),
              const SizedBox(height: 32),
              sectionSocialMedia(),
              const Spacer(),
              sectionSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row sectionSocialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemButtonSocialMedia(
          icon: AppAssets.facebookIcon,
          onTap: () {},
        ),
        const SizedBox(width: 32),
        ItemButtonSocialMedia(
          icon: AppAssets.googleIcon,
          onTap: () {},
        ),
        Platform.isIOS ? const SizedBox(width: 32) : const SizedBox(),
        Platform.isIOS
            ? ItemButtonSocialMedia(
                icon: AppAssets.appleIcon,
                onTap: () {},
              )
            : const SizedBox()
      ],
    );
  }

  Column sectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 82),
        const ButtonBack(),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Login to your Account", style: AppFont.text42Bold),
        )
            .animate()
            .fadeIn()
            .scale()
            .move(delay: 200.ms, duration: 300.ms)
            .blurXY(begin: 5, end: 0),
      ],
    );
  }

  Widget sectionFormSignIn() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      bloc: signUpBloc,
      builder: (context, state) {
        return Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BaseTextInput(
              textFieldController: emailController,
              label: "Email",
              prefixIcon: Icons.email,
              showIconPrefix: true,
            ),
          ).animate().fadeIn().scale().moveY(begin: 50, duration: 200.ms),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PasswordTextInput(
                controller: passwordController, onChange: (val) {}),
          ).animate().fadeIn().scale().moveY(begin: 50, duration: 300.ms),
          const SizedBox(height: 16),
          CheckBoxText(
            title: "Remember me",
            val: state.isChecked,
            onChange: (val) {
              signUpBloc.add(SignUpCheckBoxChangedEvent(isChecked: val));
            },
          ).animate().fadeIn().blurXY(begin: 5, end: 0),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BaseButton(
              title: "Sign in",
              onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
            ),
          ).animate().fadeIn().scale(begin: const Offset(0, 1)),
          const SizedBox(height: 32),
          InkWell(
            onTap: () {},
            child: Text("Forgot the password?",
                style:
                    AppFont.text14Bold.copyWith(color: AppColor.primaryColor)),
          )
        ]);
      },
    );
  }

  Widget sectionDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.primaryColor.withValues(alpha: .2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "or continue with",
            style: AppFont.text14SemiBold.copyWith(
              color: AppColor.primaryColor.withValues(alpha: .7),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.primaryColor.withValues(alpha: .2),
            ),
          ),
        ],
      ),
    ).animate().scale(begin: const Offset(0, 1));
  }

  Widget sectionSignInButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: AppFont.text14Normal.copyWith(
              color: AppColor.primaryColor.withValues(alpha: .5),
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(
              "Sign up",
              style: AppFont.text14Bold.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          )
        ],
      ),
    )
        .animate()
        .fadeIn()
        .scale()
        .moveY(begin: 50, duration: 300.ms)
        .blurXY(begin: 5, end: 0);
  }
}

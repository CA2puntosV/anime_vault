import 'package:anime_vault/ui/shared/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:anime_vault/ui/shared/ui_helpers.dart';
import 'package:anime_vault/ui/shared/app_colors.dart';
import 'package:anime_vault/ui/shared/assets/icons.dart';
import 'package:anime_vault/ui/shared/assets/images.dart';
import 'package:anime_vault/src/providers/auth_provider.dart';
import 'package:anime_vault/ui/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserAuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        children: [
          const _Titles(),
          30.0.spaceV,
          CustomTextField(
            title: 'Email',
            controller: provider.lEmailController,
            onChanged: (email) {},
          ),
          30.0.spaceV,
          CustomTextField(
            title: 'Password',
            obscureText: true,
            controller: provider.lPasswordController,
            onChanged: (email) {},
          ),
          20.0.spaceV,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20.0,
                  width: 0.0,
                  child: Checkbox(
                    value: false,
                    onChanged: (active) {},
                  ),
                ),
                15.0.spaceH,
                Text(
                  'Remember me',
                  style: AppTextStyles.smallbold,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'Forgot password?',
                  style: AppTextStyles.smallbold,
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              // AuthRepository().logIn(
              //   email: '',
              //   password: provider.lPasswordController.text,
              // );
            },
          ),

          // ElevatedButton(
          //   child: const Text('reigster'),
          //   onPressed: () {
          //     AuthRepository().createUser(
          //       user: UserModel(
          //         uid: '',
          //         userName: 'Testing',
          //         fullName: 'Testing User',
          //         email: provider.lEmailController.text,
          //       ),
          //       password: provider.lPasswordController.text,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

class _Titles extends StatelessWidget {
  const _Titles();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 55,
        bottom: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppIcons.luffy,
              ),
              10.0.spaceH,
              Image.asset(
                AppIcons.marinero,
              ),
              10.0.spaceH,
              Image.asset(
                AppIcons.tanjiro,
              ),
            ],
          ),
          Image.asset(
            AppImages.loginTitle,
          ),
        ],
      ),
    );
  }
}

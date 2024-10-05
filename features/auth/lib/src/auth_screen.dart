import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/password_rules/password_rules.dart';
import 'widgets/success_message.dart';

class AuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.appBigPagesPadding),
                  child: Column(
                    children: <Widget>[
                      Text(
                        LocaleKeys.common_appTitle.tr(),
                        style: AppFonts.raleway36Bold.copyWith(
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: AppDimens.bigSpacer),
                      Text(
                        LocaleKeys.auth_participationID.tr(),
                        style: AppFonts.raleway24SemiBold,
                      ),
                      Text(
                        '942863938',
                        style: AppFonts.raleway24SemiBold.copyWith(
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: AppDimens.doubleDefaultSpacer),
                      SuccessMessage(
                        message: LocaleKeys.auth_phoneNumberVerified.tr(),
                      ),
                      const SizedBox(height: AppDimens.bigSpacer),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              LocaleKeys.auth_createPassword.tr(),
                              style: AppFonts.raleway24SemiBold.copyWith(
                                color: colors.title,
                              ),
                            ),
                            const SizedBox(height: AppDimens.doubleDefaultSpacer),
                            const Padding(
                              padding: EdgeInsets.only(left: AppDimens.mediumSmallSpacer),
                              child: PasswordRules(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimens.bigSpacer),
                      AppTextFormField(
                        hintText: LocaleKeys.auth_enterPasswordHint.tr(),
                        obscureText: true,
                      ),
                      const SizedBox(height: AppDimens.doubleDefaultSpacer),
                      AppTextFormField(
                        hintText: LocaleKeys.auth_confirmPasswordHint.tr(),
                        obscureText: true,
                      ),
                      const SizedBox(height: AppDimens.mediumSpacer),
                      AppButton(
                        title: LocaleKeys.auth_continueButton.tr(),
                        onTap: AppNavigator.pushToTodoScreen,
                      ),
                      const SizedBox(height: AppDimens.mediumSpacer),
                      AppRichText(
                        text: LocaleKeys.auth_changeParticipationID_text.tr(),
                        tapText: LocaleKeys.auth_changeParticipationID_tapText.tr(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.appPagesPadding),
              child: AppRichText(
                text: LocaleKeys.auth_licenceAgreement_text.tr(),
                tapText: LocaleKeys.auth_licenceAgreement_tapText.tr(),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

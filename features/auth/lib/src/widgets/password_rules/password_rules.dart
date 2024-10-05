import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'password_rules_item.dart';

class PasswordRules extends StatelessWidget {
  const PasswordRules();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(LocaleKeys.passwordRules_title.tr()),
        const SizedBox(height: 8),
        PasswordRulesItem(
          rule: LocaleKeys.passwordRules_charactersCount.tr(),
        ),
        PasswordRulesItem(
          rule: LocaleKeys.passwordRules_upperAndLower.tr(),
        ),
        PasswordRulesItem(
          rule: LocaleKeys.passwordRules_specialCharacter.tr(),
        ),
      ],
    );
  }
}

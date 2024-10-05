import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'riverpod/create_todo_provider.dart';

class CreateTodoScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
            left: AppDimens.appBigPagesPadding,
            right: AppDimens.appBigPagesPadding,
            bottom: AppDimens.appBigPagesPadding,
          ),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final String? successMessage = ref.watch(createTodoProvider).successMessage;
              final String? errorMessage = ref.watch(createTodoProvider).errorMessage;

              if (successMessage != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        successMessage,
                        style: AppFonts.raleway16Regular.copyWith(
                          color: context.theme.colors.successContent,
                        ),
                      ),
                    ),
                  );
                });
              }

              if (errorMessage != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        errorMessage,
                        style: AppFonts.raleway16Regular.copyWith(
                          color: context.theme.colors.successContent,
                        ),
                      ),
                    ),
                  );
                });
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppTextFormField(
                    maxLines: 3,
                    controller: controller,
                    hintText: LocaleKeys.createTodo_hintText.tr(),
                    inputFormatters: <TextInputFormatter>[
                      CustomTextFieldFormatter(),
                      LengthLimitingTextInputFormatter(100),
                    ],
                  ),
                  AppButton(
                    title: LocaleKeys.createTodo_button.tr(),
                    onTap: () {
                      ref.read(createTodoProvider.notifier).createTodo(controller.text);
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

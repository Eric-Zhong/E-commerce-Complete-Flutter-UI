import 'package:dragonai/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';

class SmsVerificationForm extends StatelessWidget {
  const SmsVerificationForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: authProvider.smsVerificationController,
            validator: smsVerificationValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "6位数字验证码",
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Message.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              // 添加清除按钮
              suffixIcon: authProvider.smsVerificationController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => authProvider.smsVerificationController.clear(),
                    )
                  : null,
            ),
            onChanged: (value) {
              // pass
            },
          ),
        ],
      ),
    );
  }
}

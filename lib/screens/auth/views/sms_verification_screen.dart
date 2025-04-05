import 'package:dragonai/providers/auth_provider.dart';
import 'package:dragonai/screens/auth/views/components/sms_verification_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/route/route_constants.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SmsVerificationScreen extends StatefulWidget {
  const SmsVerificationScreen({super.key});

  @override
  State<SmsVerificationScreen> createState() => _SmsVerificationScreenState();
}

class _SmsVerificationScreenState extends State<SmsVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: true);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/signUp_dark.png",
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "输入短信验证码",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding),
                    // Form
                    SmsVerificationForm(formKey: _formKey),
                    //
                    const SizedBox(height: defaultPadding),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = !authProvider.canSendSms
                                ? null
                                : () async {
                                    // Navigator.pushNamed(context, termsOfServicesScreenRoute);
                                    var response = await authProvider.sms("1");
                                    if (response) {
                                      // 跳转到短信验证页面
                                      Navigator.pushNamed(context, smsVerificationScreenRoute);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("验证码发送失败, ${authProvider.error}"),
                                        ),
                                      );
                                    }
                                  },
                          // text: " Terms of service ",
                          text: "重新发送${authProvider.countdown == 0 ? '' : '(${authProvider.countdown})s'}",
                          // style: const TextStyle(
                          //   color: primaryColor,
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    // const SizedBox.expand(),
                    ElevatedButton(
                      onPressed: authProvider.agree
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                var response = await authProvider.register();
                                if (!mounted) return;
                                if (response) {
                                  Navigator.pushNamed(context, entryPointScreenRoute);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(authProvider.error ?? '注册失败')),
                                  );
                                }
                              }
                            }
                          : null,
                      child: const Text("下一步"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

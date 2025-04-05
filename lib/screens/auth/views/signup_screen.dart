import 'package:dragonai/providers/auth_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/screens/auth/views/components/sign_up_form.dart';
import 'package:dragonai/route/route_constants.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
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
                    "手机号登录/注册!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text("请输入你的手机号和密码。"),
                  const SizedBox(height: defaultPadding),
                  SignUpForm(formKey: _formKey),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          authProvider.setAgree(value!);
                        },
                        value: authProvider.agree,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            // text: "I agree with the",
                            text: "已阅读并同意",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.pushNamed(context, termsOfServicesScreenRoute);
                                  },
                                // text: " Terms of service ",
                                text: "《服务条款》",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "和",
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.pushNamed(context, termsOfServicesScreenRoute);
                                  },
                                // text: " Terms of service ",
                                text: "《隐私政策》",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: authProvider.agree
                        ? () async {
                            if (_formKey.currentState!.validate()) {
                              // 验证手机号是否可用
                              bool response = await authProvider.checkPhoneIsAvailable();
                              if (response) {
                                if (authProvider.canSendSms) {
                                  String smsmode = "1"; // 1:注册，2：登录
                                  response = await authProvider.sms(smsmode);
                                }
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
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("手机号已注册，不能重复注册！"),
                                  ),
                                );
                              }
                            }
                          }
                        : null,
                    child: const Text("下一步"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("已经注册过账号?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, logInScreenRoute);
                        },
                        child: const Text("登录"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

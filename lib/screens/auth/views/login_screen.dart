import 'package:flutter/material.dart';
import 'package:dragonai/constants.dart';
import 'package:dragonai/route/route_constants.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // KB: GlobalKey<FormState> 是 Flutter 中用于操作 Form 表单的一个重要工具。
  // _formKey.currentState!.validate()
  // _formKey.currentState!.save();
  // _formKey.currentState!.reset();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // state variables
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_dark.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Welcome back!",
                    "欢迎回来",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    // "Log in with your data that you intered during your registration.",
                    "请使用手机号、密码登录。",
                  ),
                  const SizedBox(height: defaultPadding),
                  LogInForm(formKey: _formKey),
                  // 增加记住密码选项
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            _isRememberMe = value!;
                          });
                        },
                        value: _isRememberMe,
                      ),
                      const Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "记住密码，下次自动登录。",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    child: TextButton(
                      // child: const Text("Forgot password"),
                      child: const Text("忘记密码"),
                      onPressed: () {
                        Navigator.pushNamed(context, passwordRecoveryScreenRoute);
                      },
                    ),
                  ),
                  // 调整登录 form 与底部 login 按键的空白空间高度
                  SizedBox(
                    height: size.height > 700 ? size.height / 100 : defaultPadding,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamedAndRemoveUntil(context, entryPointScreenRoute, ModalRoute.withName(logInScreenRoute));
                      }
                    },
                    // child: const Text("Log in"),
                    child: const Text("登录"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Text("Don't have an account?"),
                      const Text("没有账号?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, signUpScreenRoute);
                        },
                        // child: const Text("Sign up"),
                        child: const Text("注册新用户"),
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

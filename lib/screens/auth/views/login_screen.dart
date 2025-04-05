import 'package:dragonai/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/constants.dart';
import 'package:dragonai/route/route_constants.dart';
import 'package:provider/provider.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // KB: GlobalKey<FormState> 是 Flutter 中用于操作 Form 表单的一个重要工具。
  /*
    _formKey.currentState!.validate()
    _formKey.currentState!.save();
    _formKey.currentState!.reset();
  */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // providers
  late final AuthProvider _authProvider; // 添加成员变量

  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // KB: 临时状态 - 在使用处注册
    // return ChangeNotifierProvider(
    //   create: (_) => FormProvider(),
    //   child: FormContent(),
    // );

    // KB: Provider 的注册方式, 功能模块状态 - 在模块根组件注册
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
                            _authProvider.setRememberMe(value!);
                          });
                        },
                        value: _authProvider.rememberMe,
                      ),
                      const Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "记住手机号和密码，下次自动登录。",
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (!mounted) return;
                        // KB: Navigator.pushNamedAndRemoveUntil() 清除历史并跳转（常用于登录后跳转到主页）
                        /* 学习示例
                          // 场景1：登录成功后完全清除历史
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (route) => false,  // 清除所有历史
                          );

                          // 场景2：保留主页和登录页
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/success',
                            (route) => route.settings.name == '/home' || route.settings.name == '/login',
                          );

                          // 场景3：保留特定前缀的路由
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/dashboard',
                            (route) => route.settings.name?.startsWith('/auth') ?? false,
                          );
                        */
                        /*
                          这段代码的用途：
                          跳转到 entryPointScreenRoute（比如主页）
                          清除路由栈中的所有页面，直到遇到名为 logInScreenRoute 的路由
                          保留 logInScreenRoute（登录页）在栈中
                        */
                        bool result = await _authProvider.login();

                        if (!mounted) return;

                        if (result) {
                          // 登录成功后清除历史并跳转到 entryPointScreenRoute（比如主页）
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            entryPointScreenRoute,
                            // 保留页
                            // ModalRoute.withName(logInScreenRoute), // dragonai 不需要保留登录页
                            (route) => false, // 清除所有历史
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                // "登录失败，请检查用户名或密码是否正确。",
                                _authProvider.error ?? "出错啦，请检查用户名或密码是否正确。",
                              ),
                            ),
                          );
                        }
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
                        child: const Text("新用户注册"),
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

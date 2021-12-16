import 'package:flutter/material.dart';
import 'package:tacaro/modules/login/login_controller.dart';
import 'package:tacaro/modules/login/repositories/login_repository_impl.dart';
import 'package:tacaro/shared/services/app_database.dart';
import 'package:tacaro/shared/theme/app_theme.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = LoginController(
      repository: LoginRepositoryImpl(database: AppDatabase.instance),
    );
    controller.addListener(() {
      controller.state.when(
          success: (value) =>
              Navigator.pushNamed(context, "/home", arguments: value),
          error: (message, _) => scaffoldKey.currentState!
              .showBottomSheet((context) => BottomSheet(
                  onClosing: () {},
                  // ignore: avoid_unnecessary_containers
                  builder: (context) => Container(
                        child: Text(message),
                      ))),
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppTheme.colors.background,
        // para corrigir o overflow na hora de digitar no celular
        //https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                  ),
                  InputText(
                    label: "E-mail",
                    hint: "Digite seu email",
                    validator: (value) =>
                        isEmail(value) ? null : "Digite um e-mail válido",
                    onChanged: (value) => controller.onChange(email: value),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InputText(
                    label: "Senha",
                    obscure: true,
                    hint: "Digite sua senha",
                    validator: (value) => value.length >= 6
                        ? null
                        : "Digite uma senha mais forte",
                    onChanged: (value) => controller.onChange(password: value),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (_, __) {
                        return controller.state.when(
                          loading: () => CircularProgressIndicator(),
                          orElse: () => Column(
                            children: [
                              Button(
                                label: "Entrar",
                                onTap: () {
                                  controller.login();
                                },
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Button(
                                label: "Criar conta",
                                type: ButtonType.outline,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/login/create-account");
                                },
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:app_cobro_v2/src/core/theme/app_colors.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/state/auth_state.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/user_data_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../widget/input_widget.dart';

@RoutePage()
class LoginPages extends HookConsumerWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = useTextEditingController();
    final passwordCtrl = useTextEditingController();

    final state = ref.watch(authStateNotifierProvider);
    ref.listen(authStateNotifierProvider, (previous, next) {
      if (next is Fallo) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.exception.message)));
      } else if (next is Success) {
        debugPrint('entramos para navegar');
      }
    });

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/userLogin2-.png')),
                  const SizedBox(height: 70),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Input(
                    controller: emailCtrl,
                  ),
                  const Text(
                    'Contraseña',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Input(
                    obscureText: true,
                    controller: passwordCtrl,
                  ),
                  state.maybeMap(
                      loading: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      orElse: () =>
                          loginButton(formKey, ref, emailCtrl, passwordCtrl))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container loginButton(GlobalKey<FormState> formKey, WidgetRef ref,
      TextEditingController emailCtrl, TextEditingController passwordCtrl) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20), // Establecer bordes redondeados aquí
              ),
              backgroundColor: AppColors.primary),
          onPressed: () async {
            debugPrint(formKey.currentState!.validate().toString());
            if (formKey.currentState!.validate()) {
              ref.read(authStateNotifierProvider.notifier).login(LoginParams(
                  email: emailCtrl.text.trim(),
                  password: passwordCtrl.text.trim()));
              // Si el formulario es válido, realiza la acción deseada.
            }
          },
          icon: const Icon(Icons.login),
          label: const Text('Acceder')),
    );
  }
}

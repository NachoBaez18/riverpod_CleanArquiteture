import 'package:app_cobro_v2/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Input extends HookWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  const Input(
      {super.key,
      required this.controller,
      this.obscureText = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final isVisility = useState(obscureText ? false : true);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'El campo es obligatorio';
          } else {
            return null;
          }
        },
        obscureText: !isVisility.value,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: obscureText
                ? IconButton(
                    color: AppColors.primary,
                    icon: Icon(isVisility.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      isVisility.value = isVisility.value ? false : true;
                    },
                  )
                : null,
            fillColor: AppColors.lightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}

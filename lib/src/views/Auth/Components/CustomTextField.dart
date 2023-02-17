import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String placedholder;
  final bool isObscurable;
  TextEditingController controller;
  final bool isRequired;
  final List<FormFieldValidator<String>>? validators;
  CustomTextField(
      {super.key,
      this.label = "",
      this.placedholder = "",
      this.isObscurable = false,
      required this.controller,
      this.validators,
      this.isRequired = true,
      this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscured = false;
  @override
  void initState() {
    super.initState();

    if (widget.isObscurable) _obscured = true;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: TextFormField(
        validator: (value) {
          if (!widget.isRequired) return null;
          List<FormFieldValidator<String>> validators = [
            (v) => v == null || v.isEmpty ? 'Ce champ est obligatoire' : null,
            ...?widget.validators
          ];
          for (FormFieldValidator<String> validator in validators) {
            String? validation = validator(widget.controller.text);
            if (validation != null) return validation;
          }
          return null;
        },
        obscureText: _obscured,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: colors.tertiaryContainer,
                )
              : null,
          suffixIcon: widget.isObscurable
              ? IconButton(
                  icon: Icon(
                    _obscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: colors.tertiaryContainer,
                  ),
                  onPressed: () => setState(() => _obscured = !_obscured))
              : null,
          hintText: widget.placedholder,
          filled: true,
          fillColor: const Color.fromARGB(50, 252, 252, 255),
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 12),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.tertiaryContainer.withAlpha(200)),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.tertiaryContainer.withAlpha(150)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

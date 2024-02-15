import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class TextFormFieldProperties {
  final void Function(String? value)?onChanged;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? labelText;
  final void Function(String? value)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final TextInputAction textInputAction;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;

  const TextFormFieldProperties({
    this.onTap,
    this.onChanged,
    this.keyboardType=TextInputType.number,
    this.minLines,
    this.maxLines,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.focusNode,
    this.labelText,
    this.onFieldSubmitted,
    this.validator,
  });
}

class CustomTextFormField extends StatelessWidget {
  final TextFormFieldProperties textFormFieldProperties;
  
  const CustomTextFormField({
    super.key,
    required this.textFormFieldProperties,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap:textFormFieldProperties.onTap,
      keyboardType: textFormFieldProperties.keyboardType,
      minLines: textFormFieldProperties.minLines,
      maxLines: textFormFieldProperties.maxLines??1,
      cursorColor: ColorManager.white,
      style: Theme.of(context).textTheme.labelLarge,
      controller: textFormFieldProperties.controller,
      focusNode: textFormFieldProperties.focusNode,
      validator:textFormFieldProperties.validator,
      onChanged: textFormFieldProperties.onChanged,
      textInputAction: textFormFieldProperties.textInputAction,
      onFieldSubmitted: textFormFieldProperties.onFieldSubmitted,
      decoration: _inputDecoration(context),
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      labelText: textFormFieldProperties.labelText,
      labelStyle: Theme.of(context).textTheme.displayLarge,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      enabledBorder: _cutomBorder(ColorManager.white, 2),
      focusedBorder: _cutomBorder(ColorManager.white, 2),
      focusedErrorBorder: _cutomBorder(ColorManager.white, 2),
      errorBorder: _cutomBorder(ColorManager.red, 2),    
    );
  }

  InputBorder _cutomBorder(Color color, double width) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
    borderRadius: BorderRadius.circular(10),
  );
}

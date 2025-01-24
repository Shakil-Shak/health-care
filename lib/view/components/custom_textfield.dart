import 'package:flutter/material.dart';
import 'package:health_care/const/color.dart';

Widget commonTextfield(
  TextEditingController controller, {
  FocusNode? focusNode,
  bool isBold = false,
  bool issuffixIconVisible = false,
  Widget? suffinxIcon,
  bool isPasswordVisible = false,
  enable,
  fontWeight,
  prifixIconWidget,
  Color borderColor = AppColor.primaryColorLight,
  double borderWidth = 1.0,
  String hintText = '',
  TextStyle? hintStyle,
  TextInputType keyboardType = TextInputType.text,
  String? assetIconPath,
  int maxLine = 1,
  TextStyle? style,
  Color color = Colors.white,
  Function()? changePasswordVisibility,
  String? Function(String?)? onValidate,
  Function(String?)? onFieldSubmit,
}) {
  return Card(
    elevation: 1,
    shadowColor: Colors.black,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        controller: controller,
        enabled: enable,
        focusNode: focusNode,
        style: style,
        validator: onValidate,
        onFieldSubmitted: onFieldSubmit,
        keyboardType: keyboardType,
        maxLines: maxLine,
        obscureText: isPasswordVisible,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          fillColor: color,
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle ??
              const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: assetIconPath != null
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ImageIcon(
                    AssetImage(assetIconPath),
                    size: 24.0,
                  ),
                )
              : prifixIconWidget,
          suffixIcon: suffinxIcon ??
              (issuffixIconVisible
                  ? InkWell(
                      onTap: changePasswordVisibility,
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    )
                  : null),
        ),
      ),
    ),
  );
}

Widget commonTextfieldWithTitle(
  String title,
  TextEditingController controller, {
  FocusNode? focusNode,
  String hintText = "",
  bool isBold = true,
  bool suffixPasswordIconVisible = false,
  Widget? suffinxIcon,
  bool isPasswordVisible = false,
  enable,
  bool titleDisable = false,
  fontWeight,
  prifixIconWidget,
  color = Colors.white,
  style,
  titleColor = Colors.black,
  textSize = 14.0,
  borderWidth = 1.0,
  changePasswordVisibility,
  String prefix = "",
  TextInputType keyboardType = TextInputType.text,
  String? assetIconPath,
  Color borderColor = AppColor.primaryColorLight,
  int maxLine = 1,
  String? Function(String?)? onValidate,
  Function(String?)? onFieldSubmit,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (!titleDisable)
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: isBold ? FontWeight.bold : fontWeight,
            color: titleColor,
          ),
        ),
      if (!titleDisable) const SizedBox(height: 5),
      ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          controller: controller,
          enabled: enable,
          style: style,
          focusNode: focusNode,
          validator: onValidate,
          onFieldSubmitted: onFieldSubmit,
          keyboardType: keyboardType,
          maxLines: maxLine,
          obscureText: isPasswordVisible,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: const EdgeInsets.all(12.0),
            hintText: hintText,
            fillColor: color,
            filled: true,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            prefix: prefix.isEmpty
                ? null
                : Text(prefix, style: const TextStyle(fontSize: 14)),
            suffixIcon: suffinxIcon ??
                (suffixPasswordIconVisible
                    ? InkWell(
                        onTap: changePasswordVisibility,
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                        ),
                      )
                    : null),
            prefixIcon: assetIconPath != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImageIcon(
                      AssetImage(assetIconPath),
                      size: 24.0,
                    ),
                  )
                : prifixIconWidget,
          ),
        ),
      ),
    ],
  );
}

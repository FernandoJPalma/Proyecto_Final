import 'package:flutter/material.dart';
import 'package:proyecto_final/config/configuration_design.dart';


class TextFieldBasic extends StatefulWidget {
  const TextFieldBasic({
    super.key,
    required this.txtController,
    required this.label,
    required this.hintText,
    required this.kbtype,
    this.icon,
    this.textError,
    this.validator,
  });
  final TextEditingController txtController;
  final Widget label;
  final String hintText;
  final TextInputType kbtype;
  final Icon? icon;
  final String? textError;
  final bool Function(String)? validator;

  @override
  State<TextFieldBasic> createState() => _TextFieldBasicState();
}

class _TextFieldBasicState extends State<TextFieldBasic> {
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.txtController,
      keyboardType: widget.kbtype,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColor().iconColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColor().primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.all(22),
        label: widget.label,
        hintText: widget.hintText,
        prefixIcon: widget.icon,
        hintStyle: TextStyle(color: ThemeColor().secondary),
        labelStyle: TextStyle(
          color: !error ? ThemeColor().secondary : Colors.red,
        ),
        prefixIconColor: !error ? ThemeColor().iconColor : Colors.red,
        errorText: !error ? null : widget.textError,
        errorStyle: !error ? null : TextStyle(color: Colors.red),
      ),
      onChanged: (value) {
        setState(() {});
        if(widget.validator!=null){
          error = widget.validator!(value);
        }
        
      },
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({
    super.key,
    required this.txtController,
    required this.label,
    required this.hintText,
    required this.kbtype,
    required this.icon, this.textError, this.validator,
  });
  final TextEditingController txtController;
  final Widget label;
  final String hintText;
  final TextInputType kbtype;
  final Icon icon;
  final String? textError;
  final bool Function(String)? validator;
  
  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  var obsText = true;
  var error = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.txtController,
      obscureText: obsText,
      keyboardType: widget.kbtype,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColor().iconColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ThemeColor().primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.all(22),
        label: widget.label,
        hintText: widget.hintText,
        prefixIcon: widget.icon,
        hintStyle: TextStyle(color: ThemeColor().secondary),
        labelStyle: TextStyle(
          color: !error ? ThemeColor().secondary : Colors.red,
        ),
        prefixIconColor: !error ? ThemeColor().iconColor : Colors.red,
        errorText: !error ? null : widget.textError,
        errorStyle: !error ? null : TextStyle(color: Colors.red),
        suffixIconColor: ThemeColor().iconColor,
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          onPressed: () {
            obsText ? obsText = false : obsText = true;
            setState(() {});
          },
        ),
      ),
       onChanged: (value) {
        setState(() {});
        if(widget.validator!=null){
          error = widget.validator!(value);
        }
        
      },
    );
  }
}

import 'package:chat_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomField extends StatefulWidget {
  final bool isPass;
  final IconData icon;
  final String label;
  final TextEditingController controller;
  const CustomField({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.isPass = false,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obsecure = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'required' : null,
        obscureText: obsecure,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: myPrimaryColor),
          ),
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obsecure = !obsecure;
                    });
                  },
                  icon: Icon(Iconsax.eye),
                )
              : SizedBox(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

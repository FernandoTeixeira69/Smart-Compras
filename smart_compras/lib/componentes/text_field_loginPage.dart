import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    
      hintText: label,
      hintStyle: const TextStyle(
        fontSize: 16,
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.all(12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFF5F7AD8), width: 2.5)
    ),
  );
}

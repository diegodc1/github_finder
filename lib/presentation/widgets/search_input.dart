import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchInput({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (_) => onSearch(),
      decoration: InputDecoration(
        hintText: 'Buscar usuário',

        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearch,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.purple),
        ),

        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
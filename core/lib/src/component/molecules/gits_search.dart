import 'package:flutter/material.dart';

import '../../../core.dart';
import '../atoms/gits_container_shadow.dart';

class GitsSearch extends StatefulWidget {
  final String hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ValueChanged<String>? onChanged;

  const GitsSearch({
    super.key,
    required this.hintText,
    this.onChanged,
    this.padding,
    this.margin,
  });

  @override
  State<GitsSearch> createState() => _GitsSearchState();
}

class _GitsSearchState<T> extends State<GitsSearch> {
  @override
  Widget build(BuildContext context) {
    return GitsContainerShadow(
      margin: widget.margin,
      padding: widget.padding,
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: context.color.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: context.color.white),
              borderRadius: BorderRadius.circular(GitsSizes.s8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.color.white),
              borderRadius: BorderRadius.circular(GitsSizes.s8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: context.color.white),
              borderRadius: BorderRadius.circular(GitsSizes.s8),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: context.color.black,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: context.color.grey1,
              fontWeight: FontWeight.w600
            ),
            contentPadding: const EdgeInsets.only(top: 10, left: 14),
          ),
          style: TextStyle(color: context.color.white),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

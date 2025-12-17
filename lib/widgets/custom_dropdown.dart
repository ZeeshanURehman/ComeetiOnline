import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../utils/app_colors.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final bool enabled;
  final double borderRadius;
  final EdgeInsets contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomDropdownField({
    super.key,
    this.label,
    this.hint,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.enabled = true,
    this.borderRadius = 12,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),

        DropdownButtonFormField2<T>(

          value: (value != null && items.contains(value)) ? value : null,
          isExpanded: true,
          hint: Text(
            hint ?? '',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          iconStyleData: IconStyleData(
            icon: suffixIcon ??
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.blue),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: contentPadding,
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
              padding:
              const EdgeInsetsDirectional.only(start: 10, end: 6),
              child: prefixIcon,
            ),
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide:
              BorderSide(color: Colors.grey.shade600, width: 1.3),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            elevation: 4,
            // 👇 move the popup “card” position
            offset: const Offset(0, -5), // up 5 px (use + for down)
            // e.g. Offset(0,10) moves it 10 px down
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical:10),
          ),
          items: items
              .map((e) => DropdownMenuItem<T>(
            value: e,
            child: Text(
              itemLabel(e),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13),
            ),
          ))
              .toList(),
          onChanged: enabled ? onChanged : null,
        ),
      ],
    );
  }
}

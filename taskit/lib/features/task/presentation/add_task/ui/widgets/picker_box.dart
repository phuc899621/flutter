import 'package:flutter/material.dart';

class PickerBox extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color onColor;
  final Color borderColor;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const PickerBox({
    required this.title,
    required this.value,
    required this.backgroundColor,
    required this.onColor,
    required this.borderColor,
    required this.onTap,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: textTheme.labelSmall?.copyWith(
                        color: onColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      value,
                      style: textTheme.bodyMedium?.copyWith(
                        color: onColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (onClear != null)
                GestureDetector(
                  onTap: onClear,
                  child: Icon(Icons.clear_rounded, color: onColor, size: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A button which can either fire [onTap] directly,
/// or (if [children] is non-null/non-empty) expand to show sub-buttons.
class CategoryButton extends StatelessWidget {
  /// The text to show.
  final String label;

  /// Called when this is tapped (only for non-expanders).
  final VoidCallback? onTap;

  /// If non-empty, this button expands to reveal these children.
  final List<CategoryButton>? children;

  const CategoryButton({
    Key? key,
    required this.label,
    this.onTap,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Style for leaf buttons: raw 0xFFCC4D3D, no elevation/tint
    final leafStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFCC4D3D),
      foregroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    if (children != null && children!.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFCC4D3D),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            useMaterial3: false,
            dividerColor: Colors.transparent,
            unselectedWidgetColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.white),
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: ExpansionTile(
            title: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.expand_more, color: Colors.white),
            tilePadding: const EdgeInsets.symmetric(horizontal: 8),
            childrenPadding: const EdgeInsets.only(left: 16, bottom: 4),
            children: children!,
            backgroundColor: const Color(0xFFCC4D3D),
            collapsedBackgroundColor: const Color(0xFFCC4D3D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
          ),
        ),
      );
    }

    // SIMPLE BUTTON
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: leafStyle,
        onPressed: onTap,  // note: wire onTap into onPressed here
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

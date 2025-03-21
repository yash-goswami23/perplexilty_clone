import 'package:flutter/material.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';

class SearchBarButton extends StatefulWidget {
  final String text;
  final IconData iconData;
  const SearchBarButton({
    super.key,
    required this.text,
    required this.iconData,
  });

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:
          (event) => setState(() {
            isHover = true;
          }),
      onExit:
          (event) => setState(() {
            isHover = false;
          }),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isHover ? AppColors.proButton : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(widget.iconData, color: AppColors.iconGrey, size: 20),
            SizedBox(width: 8),
            Text(widget.text, style: TextStyle(color: AppColors.textGrey)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final String fullDescription;

  const DescriptionWidget({Key? key, required this.fullDescription})
      : super(key: key);

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: isExpanded
                      ? widget.fullDescription
                      : widget.fullDescription.length > 200
                          ? '${widget.fullDescription.substring(0, 200)}... '
                          : widget.fullDescription,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? "Show Less" : "Show More",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

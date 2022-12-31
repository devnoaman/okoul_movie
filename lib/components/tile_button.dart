import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onTap,
        padding: EdgeInsets.symmetric(horizontal: 16),
        fillColor: Theme.of(context).canvasColor,
        child: SizedBox(
          height: 55,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Spacer(),
            ],
          ),
        ),
        // child: Container(
        //   width: double.infinity,
        //   margin: EdgeInsets.symmetric(horizontal: 16),
        //   height: 55,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(12),
        //       topRight: Radius.circular(12),
        //       bottomLeft: Radius.circular(12),
        //       bottomRight: Radius.circular(12),
        //     ),
        //     color: Color.fromRGBO(255, 255, 255, 1),
        //   ),
        // ),
      ),
    );
  }
}

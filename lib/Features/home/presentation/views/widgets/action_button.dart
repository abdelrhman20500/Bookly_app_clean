import 'package:flutter/material.dart';
import '../../../../../Core/utils/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
           Expanded(
            child: CustomButton(
              onPressed: (){},
              text: "free",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: (){},
              fontSize: 16,
              text: getText(),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  String getText() {
    return "Preview";
  }
}

import 'package:flutter/material.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../ui/common/app_colors.dart';
import '../../../ui/common/app_strings.dart';

class CheckBoxAgent extends StatefulWidget {
  final SellFormProvider sellFormProvider;
  final bool isButtonDisabled;
  double? textSize = 20;
  String text = "Send Agent";

  CheckBoxAgent({
    Key? key,
    required this.sellFormProvider,
    required this.isButtonDisabled,
    this.textSize,
    this.text = "Send Agent",
  }) : super(key: key);

  @override
  _CheckBoxAgentState createState() => _CheckBoxAgentState();
}

class _CheckBoxAgentState extends State<CheckBoxAgent> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isButtonDisabled;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 150.0),
      child: CheckboxListTile(
        title: Text(
          widget.text,
          style: TextStyle(
            color: fontSecondColor,
            fontFamily: fontOutfitRegular,
            fontSize: widget.textSize ?? 20.0,
          ),
        ),
        activeColor: confirmButtonColor,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false;
          });
          widget.sellFormProvider.sendAgent = 'isChecked';
        },
      ),
    );
  }
}

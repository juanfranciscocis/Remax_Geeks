import 'package:flutter/material.dart';

import '../../../providers/sellFormProvider.dart';
import '../../../ui/common/app_colors.dart';
import '../../../ui/common/app_strings.dart';


//AGENT CHECKBOX
class CheckBoxAgent extends StatefulWidget {
  bool isButtonDisabled;
  CheckBoxAgent({
    super.key,
    required this.sellFormProvider,
    required this.isButtonDisabled,
  });

  final SellFormProvider sellFormProvider;

  @override
  State<CheckBoxAgent> createState() => _CheckBoxAgentState();
}

class _CheckBoxAgentState extends State<CheckBoxAgent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 150.0, right: 150.0),
      child: CheckboxListTile(
        title: Text(
          "Send Agent",
          style: TextStyle(
            color: fontSecondColor,
            fontFamily: fontOutfitRegular,
            fontSize: 20,
          ),
        ),
        activeColor: confirmButtonColor,
        value: widget.isButtonDisabled,
        onChanged: (bool? value) {
          //Checkbox
          setState(() {
            widget.isButtonDisabled = value!;
          });
          widget.sellFormProvider.sendAgent = value!;
          print(widget.sellFormProvider.sendAgent);
        },
      ),
    );
  }
}
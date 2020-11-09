import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckBox Demo title',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CheckBox Demo class'),
          backgroundColor: Colors.greenAccent,
        ),
        body: SafeArea(  // จะอยู่กลางจอ
          child: Center(
            child: CheckBoxWidget(),
          ),
        ),
      ),
    );
  }
}

/* คล้ายๆ กับการสร้าง component */
class CheckBoxWidget extends StatefulWidget {
/* StatefulWidget	ต้อง override CreateState()*/
  @override
  CheckBoxWidgetClass createState() => new CheckBoxWidgetClass();
}

class CheckBoxWidgetClass extends State {
  bool isChecked = false;
  String resultHolder = "Checked is UnChecked";

  void toggleCheckBox(bool value) {
    if (!isChecked) {
      setState(() {
        isChecked = true;
        resultHolder = "Checked is Checked";
      });
    } else {
      setState(() {
        isChecked = false;
        resultHolder = "Checked is UnChecked";
      });
    }
  }

  /* ต้อง return เป็น รูปร่าง การจัดลำดับ ด้วย*/
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.scale(
          scale: 2, // สั่งให้ขยายขนาดของ object
          child: Checkbox(
            value: isChecked,
            checkColor: Colors.white,
            activeColor: Colors.redAccent,
            hoverColor: Colors.greenAccent,
            onChanged: (value) => toggleCheckBox(value),
            tristate: false, // true สามารถ มี null ได้ เครื่องหมาย "-"
          ),
        ),
        Text('$resultHolder')
      ],
    );
  }
}

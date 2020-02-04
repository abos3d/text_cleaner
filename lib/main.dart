import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  static const String EXTRA_LETTERS = "ًًٌٌٍٍََُُِِّّْْٕٓٔ«»ـ’^"+ "ٖ
//"+""      ٗ";
//  static const String EXTRA_LETTERS = "ضصثقفغعهخحجةكمنتالبيسشظطذدزروؤإأءئىآىی" ;
  static const String EXTRA_LETTERS = "ﹿﹾﹽﹼﹻﹺﹲﹴﹶﹷﹸﹹﹱﹰ۪۬۫۩۰ۭۣۨۧۡۢۥۦ۟۠۞ۜۛۖۗۘۙۚ۔٫ًٌٍَُِّْٓﷹﷸﷷﷰﷱﷳﷴﷵﷻﷺـ" ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arabic Text Cleaner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Arabic Text Cleaner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = TextEditingController();

  void onTextChanged(String text) {
    String afterText = "";
    for (int i = 0; i < text.length; i++) {
      if (!MyApp.EXTRA_LETTERS.contains(text[i])) {
        afterText = afterText + text[i];
      }
    }





    var cursorPos = controller.selection;

    controller.text = afterText;

    if (cursorPos.start > controller.text.length) {
      cursorPos = new TextSelection.fromPosition(
          new TextPosition(offset: controller.text.length));
    }
    controller.selection = cursorPos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("ضع النص وسيتم تخفيفه بشكل تلقائي"),
            TextField(
              onChanged: onTextChanged,
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color ctwo = Colors.purpleAccent;
  static const List<String> quoteList = [
    'ยุคนี้พรหมลิขิต ก็สู้บัตรเครดิตไม่ได้หรอก',
    'วันนี้ไม่เห็นค่า วันหน้าก็ได้ เราว่างทุกวันแหละ',
    'ยามใดที่เราทุกข์... ชาไข่มุกคือพลัง',
    'ใจสั่นๆ นึกว่าเศร้า ที่ไหนได้หิวข้าวนี่เอง',
    'คนที่ทำให้เราหลง คือคนที่ส่งโลเคชั่นผิด',
  ];
  static List<Color> colorsList = [
    Colors.blue,
    Colors.yellowAccent,
    Colors.grey,
    Colors.pink,
    Colors.green,
  ];
  Random random = Random();
  //random quote
  var quote = quoteList[0]; // state variable
  var check = quoteList[0];
  var checkColor = colorsList[0];
  void _handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      if(check == quote){
        while(true) {
          rand = Random();
          randomIndex = rand.nextInt(quoteList.length);
          quote = quoteList[randomIndex];
          if (check != quote) {
            quote = quoteList[randomIndex];
            check = quote;
            break;
          }
        }
      }else{
        quote = quoteList[randomIndex];
        check = quoteList[randomIndex];
      }
      //random Text colors
      int cindex = random.nextInt(colorsList.length);
      Color tempcol = colorsList[cindex];
      if(checkColor == tempcol){
        while(true){
          random = Random();
          cindex = random.nextInt(colorsList.length);
          tempcol = colorsList[cindex];
          if (checkColor != tempcol) {
            tempcol = colorsList[cindex];
            checkColor = tempcol;
            break;
          }
        }
      }else{
        tempcol = colorsList[cindex];
        checkColor = colorsList[cindex];
      }

      setState(() {
        ctwo = tempcol;
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,//_ คือ การทำ private
        child: const Text('next quote', textAlign: TextAlign.center,),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              quote,
              style: TextStyle(
                color: ctwo,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}

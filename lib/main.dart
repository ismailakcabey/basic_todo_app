import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ToDo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textreading = TextEditingController();

  List ShopingList = [];


  add (){
    setState(() {
      ShopingList.add(textreading.text);
      textreading.clear();
    });
  }

  remove (){
    setState(() {
      ShopingList.remove(textreading.text);
      textreading.clear();
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text("ToDo",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(

                child: ListView.builder(

                  itemCount: ShopingList.length,
                  itemBuilder: (context,index)=>ListTile(
                    tileColor: Colors.yellow,
                    leading: Icon(Icons.shop),
                    title: Text(ShopingList[index],style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),


                  ),
                )),
            TextField(
              controller: textreading,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: add, child: Text("Add",style: TextStyle(color: Colors.grey),)),
                ElevatedButton(onPressed: remove, child: Text("Remove",style: TextStyle(color: Colors.grey),)),

              ],)
          ],
        ),
      ),
    );
  }
}
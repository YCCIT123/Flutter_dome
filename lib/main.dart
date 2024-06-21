import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: nextPage(),
      routes: {
        "/nextPage": (context) => nextPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              child: const Text("nextPage"),
              onPressed: () {
                Navigator.pushNamed(context, "/nextPage");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class nextPage extends StatefulWidget {
  const nextPage({super.key});

  @override
  State<nextPage> createState() => _nextPageState();
}

class _nextPageState extends State<nextPage> {
  var ans = 0;
  void ansAdd(){
    setState(() {
      ans++;
    });
  }
  void ansDel(){
    setState(() {
      ans--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("nextPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("nextPage"),
            TextButton(
              child: Text("back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              color: Colors.blue, // 背景颜色
              width: 200, // 宽度
              height: 100, // 高度
              child: Text('Hello, World!'), // 子组件
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("row"),
                  Text("row"),
                  Text("row"),
                ]
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("column"),
                  Text("column"),
                  Text("column"),
                ]
                    
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 20,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 20,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Wrap(
                children:
                List.generate(9, (index) {
                  return TextButton(
                      onPressed: () {}, child: Text("aaaaaaaaaaaa"));
                },
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RedButton(text: "增加", onPress: ansAdd),
                RedButton(text: "减少", onPress: ansDel,),
              ],
            ),
            Text('$ans'),
            Image.network(
              "https://book.flutterchina.club/assets/img/logo.png",
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
      // body: ConstrainedBox(
      //   constraints: BoxConstraints.expand(),
      //   child: Stack(
      //     alignment:Alignment.center, //指定未定位或部分定位widget的对齐方式
      //     children: <Widget>[
      //       Container(
      //         child: Text("Hello world",style: TextStyle(color: Colors.white)),
      //         color: Colors.red,
      //       ),
      //       Positioned(
      //         left: 18.0,
      //         child: Text("I am Jack"),
      //       ),
      //       Positioned(
      //         top: 108.0,
      //         child: Text("Your friend"),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class RedButton extends StatelessWidget {
  const RedButton({
    Key? key,
    required this.text,
    this.onPress,
  }): super(key: key);

  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        child: Text(text),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(150, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        )
    );
  }
}


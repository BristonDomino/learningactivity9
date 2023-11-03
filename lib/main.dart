import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CIS 3334 Currency Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  int _counter = 0;
  final TextEditingController dollarTextField = TextEditingController();
  final TextEditingController euroTextField = TextEditingController();
  double _dollars = 0;
  double _euros = 0;
  double _conversionRate = 1.19;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Text("Dollars:"),
            TextField(controller: dollarTextField),
              ElevatedButton(
                onPressed: () {
                  _dollars = double.parse(dollarTextField.text);
                  _euros = _dollars * _conversionRate;
                  euroTextField.text = _euros.toStringAsFixed(2);
                },
                child: Text("Convert to Euros"),
            ),
            Text("Euros:"),
            TextField(controller: euroTextField),
            ElevatedButton(
              onPressed: () {
                _euros = double.parse(euroTextField.text);
                _dollars = _euros / _conversionRate;
                dollarTextField.text = _dollars.toStringAsFixed(2);
              },
              child: Text("Convert to Dollars")
            ),
          ],
        ),
      ),
    );
  }
}

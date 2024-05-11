import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Shoe {
  final String name;
  final String sub;
  final double price;
  final Color color;
  final String imageUrl;

  Shoe({required this.name, required this.sub, required this.price, required this.imageUrl, required this.color});
}

List<Shoe> dummyShoes = [
  Shoe(
    name: "Nike SB Zoom Blazer Mid Premium",
    sub: "",
    price: 99.99,
    color: Color(0xFFFFD1DC),
    imageUrl: "https://cdn.discordapp.com/attachments/1160608743633997857/1238809145113710693/shoes-wasatch-running-3.png?ex=6640a26c&is=663f50ec&hm=bcc89bef008e42c8a77403e0b695283b4b74642eb8bdfdfbc455e0382ba9bebf&",
  ),
  Shoe(
    name: "Nike Air Zoom Pegasus",
    sub: "Men's Rood Running Shoes",
    price: 129.99,
    color: Color(0xFFD0B3E1),
    imageUrl: "https://cdn.discordapp.com/attachments/1160608743633997857/1238809145399054386/1635221496shoes-png-image.png?ex=6640a26c&is=663f50ec&hm=0aff8c2b92709882f039592bb77bc403295495bb34b370cb69b8f9e6af4538d6&",
  ),
  Shoe(
    name: "Nike SB Zoom Blazer Mid Premium",
    sub: "",
    price: 99.99,
    color: Color(0xFFB4D8E7),
    imageUrl: "https://static.nike.com/a/images/t_default/8a32b0da-59ec-4c1a-8bcc-d7e7136fdaf5/waffle-debut-vintage-womens-shoes-rfRkv2.png",
  ),
  // Tambahkan sepatu lainnya di sini sesuai kebutuhan
];
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class ShoeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyShoes.length,
      itemBuilder: (context, index) {
        return Card(
          color: dummyShoes[index].color,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align elements to the right
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dummyShoes[index].name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        dummyShoes[index].sub,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        dummyShoes[index].price.toString(),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Image(
                  image: NetworkImage(dummyShoes[index].imageUrl),
                  width: 200, // Sesuaikan dengan kebutuhan Anda
                  height: 200, // Sesuaikan dengan kebutuhan Anda
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildShoeItem({
      required String title,
      required String subtitle,
      required String price,
      required String imageUrl,
    }) {
      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align elements to the right
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                    price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: 16),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 40, // Adjust the radius for larger image
            ),
          ],
        ),
      );
    }
    

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoes', style: TextStyle(fontSize: 30)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://tse3.mm.bing.net/th?id=OIP.GlIuUj-GYrRL_G8WvZ3YagHaHw&pid=Api&P=0&h=180',
              ),
              radius: 25, // Modify the radius to make it slightly larger
            ),
          ),
        ],
      ),
      body:ShoeList(),
    );
  }
}

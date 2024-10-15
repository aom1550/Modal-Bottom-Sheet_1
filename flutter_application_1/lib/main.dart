import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modal Bottom Sheet Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: const Color.fromARGB(255, 53, 230, 124)),
        ),
      ),
      home: const MyHomePage(title: ' Modal Bottom Sheet Demo'),
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
  final List<String> emojis = [
    '😀', '😃', '😄', '😁', '😆', '😅', '😂', '🤣', '😊', '😇',
    '🙂', '🙃', '😉', '😌', '😍', '🥰', '😘', '😗', '😙', '😚',
  ];

  final List<String> names = [
    'สมชาย', 'วิภา', 'กานดา', 'ธนกร', 'พิมพ์มาดา',
    'ภูมิ', 'นภา', 'อนุชา', 'ศิริพร', 'ธีรพงษ์',
    'มณีรัตน์', 'ชัยวัฒน์', 'สุนิสา', 'วรรณชนก', 'ปิยะ',
    'จิราพร', 'ณัฐพล', 'อรุณี', 'ธนวัฒน์', 'กัลยา'
  ];

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller) => Column(
          children: [
            Container(
              height: 5,
              width: 40,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('Welcome to Modal Bottom Sheet'),
                    subtitle: Text('Swipe up for more information'),
                  ),
                  const Divider(),
                  ...List.generate(
                    20,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 217, 227, 69),
                        child: Text(emojis[index]),
                      ),
                      title: Text(names[index]),
                      subtitle: Text('รายละเอียดเกี่ยวกับ ${names[index]}'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 115, 239, 156), const Color.fromARGB(255, 21, 112, 216)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'กดปุ่มเพื่อแสดง Modal Bottom Sheet:',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showModalBottomSheet,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: const Color.fromARGB(255, 219, 141, 38),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('แสดง Modal Bottom Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

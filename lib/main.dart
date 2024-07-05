import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Column(
          children: [
            TextField(
              controller: ctrl,
              decoration: const InputDecoration(
                hintText: "Enter your clicker server ip",
                hintStyle: TextStyle(color: Colors.white),
                focusColor: Colors.white,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      child: ElevatedButton(
                          onPressed: () {
                            http.get(Uri.parse("${ctrl.text}?dir=left"));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            "Left",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      child: ElevatedButton(
                          onPressed: () {
                            http.get(Uri.parse("${ctrl.text}?dir=right"));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            "Right",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

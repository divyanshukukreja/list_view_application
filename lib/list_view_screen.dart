import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  var indexController = TextEditingController();
  List<Color> itemColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  int selectedColorIndex = 0;
  int listCount = 12;
  bool isEvenEnabled = false;

  get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  setState(() {
                    selectedColorIndex = 0;
                  });
                },
                child: const Text(
                  "Red",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                onPressed: () {
                  setState(() {
                    selectedColorIndex = 1;
                  });
                },
                child: const Text(
                  "blue",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  setState(() {
                    selectedColorIndex = 2;
                  });
                },
                child: const Text(
                  "green",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Count"),
            ),
            Container(
              height: 50,
              width: 100,
              child: TextField(
                controller: indexController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Index',
                ),
              ),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
                onPressed: () {
                  setState(() {
                    listCount = int.tryParse(indexController.text) ?? 0;
                  });
                },
                child: const Text(
                  "Enter",
                  style: TextStyle(color: Colors.white),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    setState(() {
                      isEvenEnabled = !isEvenEnabled;
                    });
                  },
                  child: const Text(
                    "Even",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      Row(
        children: [],
      ),
      Expanded(
          child: ListView.builder(
              itemCount: listCount,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(8.0),
                  height: 50,
                  color: isEvenEnabled && index % 2 == 0
                      ? Colors.amber
                      : selectedColorIndex == 0
                          ? itemColors[0]
                          : selectedColorIndex == 1
                              ? itemColors[1]
                              : selectedColorIndex == 2
                                  ? itemColors[2]
                                  : itemColors[3],
                  child: Text("The Index Is $index"),
                );
              }))
    ]));
  }
}

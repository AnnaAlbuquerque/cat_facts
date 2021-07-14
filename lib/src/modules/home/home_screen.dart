import 'package:cat_facts/src/modules/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "{Cat Facts}",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 50,
                fontFamily: "CitCat",
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                color: Color(0xFFD7ABF0),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image(
                          image: AssetImage('assets/images/cat.png'),
                          height: 200,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Container(
                          child: homeController.currentFact.fact == ""
                              ? Text(
                                  "No cat fact found",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              : Text(
                                  homeController.currentFact.fact ??
                                      "No cat fact found",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                homeController.getFacts().then((_) {
                  setState(() {});
                });
              },
              child: Text("New Fact"),
            )
          ],
        ),
      ),
    );
  }
}

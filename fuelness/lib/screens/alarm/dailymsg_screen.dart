import 'package:flutter/material.dart';

class DailyMsg extends StatelessWidget {
  String msg;

  DailyMsg(this.msg);

  @override
  Widget build(BuildContext context) {
    double sc_height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover,
            )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(msg.split("-")[1],
                      style:
                      const TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(msg.split("-")[0],
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white)),
                ])));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.blueAccent,
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  color: Colors.white,
                  shape: CircleBorder(),
                  height: 100,
                  minWidth: 100,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamePage()));
                  },
                  child: Text("START"),
                ),
              )),
          Container(
              color: Colors.redAccent,
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Center(
                  child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 100,
                minWidth: 100,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Text("START"),
              ))),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;

  int player1score = 0;
  int player2score = 0;

  bool intialize = false;

  @override
  Widget build(BuildContext context) {
    if (!intialize) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;
      intialize = true;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  blueCardHeight = blueCardHeight + 30;
                  redCardHeight = redCardHeight - 30;
                  player1score = player1score + 5;
                });

                double screenHeight = MediaQuery.of(context).size.height;
                if (blueCardHeight >= screenHeight * 0.9) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => resultpage(player1score,"1")));
                  print("Player1 wins");
                }
              },
              padding: EdgeInsets.all(0),
              child: Container(
                width: double.infinity,
                height: blueCardHeight,
                color: Colors.blueAccent,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Player1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      player1score.toString(),
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  redCardHeight = redCardHeight + 30;
                  blueCardHeight = blueCardHeight - 30;
                  player2score = player2score + 5;
                });

                double screenHeight = MediaQuery.of(context).size.height;
                if (redCardHeight >= screenHeight * 0.9) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => resultpage(player2score,"2")));
                  print("Player2 wins");
                }
              },
              padding: EdgeInsets.all(0),
              child: Container(
                width: double.infinity,
                height: redCardHeight,
                color: Colors.redAccent,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Player2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      player2score.toString(),
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class resultpage extends StatelessWidget {
  int score=0;
  String player="";
  resultpage(this.score,this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player=="1"? Colors.blueAccent:Colors.redAccent,
      body: Center(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold),),
            Text(player==1 ? "Player1 won":"Player2 won",style: TextStyle(fontSize: 35),),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
                Navigator.pop(context);
            },
            color: Colors.white,
            child: Text("Restart Game"),)
          ],
        ),
      ),
    );
  }
}

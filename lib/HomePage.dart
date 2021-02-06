import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO: import Images

  AssetImage circle=AssetImage("images/circle.png");
  AssetImage lucky=AssetImage("images/rupee.png");
  AssetImage unlucky=AssetImage("images/sadFace.png");

  //TODO: get an array

  List<String>itemArray;
  int luckyNumber;

  //TODO: initialize your array with 25 elements

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    itemArray=List<String>.generate(25, (index) => "empty");
    generateRandomNumber();

  }


  generateRandomNumber(){

    int random=Random().nextInt(25);

    setState(() {

      luckyNumber=random;
    });
  }

  //TODO:define a getImage method


AssetImage getImage(int index){

    String currentState=itemArray[index];

    switch(currentState){

      case "lucky":
        return lucky;
        break;

      case "unlucky":
        return unlucky;
        break;
    }

    return circle;

  }

  //TODO:Play the game Method

  PlayGame(int index){

    if(luckyNumber==index){

      setState(() {

          itemArray[index]="lucky";
      });
    }

    else{

      setState(() {

        itemArray[index]="unlucky";
      });
    }
  }




  //TODO: Show all


  ShowAll(){

    setState(() {

      itemArray=List<String>.filled(25, "unlucky");
      itemArray[luckyNumber]="lucky";
    });
  }




  //TODO:Reset All

resetGame(){

    setState(() {

      itemArray=List<String>.filled(25, "empty");

    });

    generateRandomNumber();


}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Scratch and Wins"),
        centerTitle: true,


      ),

      body: Column(

        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>
        [

          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0
                  ),

                  itemCount: this.itemArray.length,


                  itemBuilder: (context,i)=>SizedBox(

                    height: 50.0,
                    width: 50.0,

                    child: RaisedButton(
                        onPressed: (){
                          this.PlayGame(i);

                        },

                      child: Image(
                        image: this.getImage(i),
                      ),



                    ),
                  ),





              )

          ),

          new RaisedButton(
              onPressed: this.ShowAll,

            textColor: Colors.white,
            child: Text("Show All"),
            color: Colors.purple,


          ),

          new RaisedButton(
            onPressed: this.resetGame,

            textColor: Colors.white,
            child: Text("Reset"),
            color: Colors.pink,



          ),





        ],

      ),
      
    );
  }
}
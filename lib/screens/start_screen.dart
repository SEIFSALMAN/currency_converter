import 'package:currency_converter/core/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'currency_changer_screen.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/StartedMoney.jpg'),
                    fit: BoxFit.cover)),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100), topRight: Radius.circular(100)),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, to',
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      'Currency Converter',
                      style: TextStyle(
                        fontFamily: 'Rowdies',
                          fontSize: 25,
                          color: Colors.green[800],
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 50, 20),
                      child: Text(
                        'This application helps you know all currency numbers and easily to convert currency and it\'s easily to use',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(130,30,44,20),
                      child: Container(
                        height: 60,
                        width: 220,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: Colors.purple[900], // background (button) color
                            onPrimary: Colors.white, // foreground (text) color
                          ),
                          onPressed: () {
                            AppNavigator.customNavigator(finish: true , context: context , screen: CurrencyChangerScreen());
                          },
                          child: const Text('Get Started!',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              color: Colors.grey[200],
              height: height * 0.45,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}
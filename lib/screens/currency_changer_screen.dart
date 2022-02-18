import 'package:currency_converter/blocs/currency_cubit.dart';
import 'package:currency_converter/core/utils/custom_button.dart';
import 'package:currency_converter/core/utils/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyChangerScreen extends StatefulWidget {
  const CurrencyChangerScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyChangerScreen> createState() => _CurrencyChangerScreenState();
}

class _CurrencyChangerScreenState extends State<CurrencyChangerScreen> {

  var amountController = TextEditingController();

  String? from;
  String? to;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return BlocConsumer<CurrencyCubit, CurrencyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var currencyCubit = CurrencyCubit.get(context);
        return Scaffold(
          body: Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.79), BlendMode.srcOver),
                image: AssetImage(
                  'assets/images/CurrencyChanger.jpg',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 55.0),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 29.0, top: 15,bottom: 90),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Currency\nConverter',
                              style: TextStyle(
                                  fontFamily: 'Rowdies',
                                  color: Colors.greenAccent,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            )),
                      ), //Text "Currency Converter"
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                width: width * 0.38,
                                child: customDropDownMenu(currencies, from, (val) {
                                  setState(() {
                                    from = val;
                                  });
                                }),
                              ),
                            ],
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              String? temp = from;
                              setState(() {
                                from = to;
                                to = temp;
                              });
                            },
                            child: Icon(Icons.swap_horiz_outlined,size: 38,),
                            backgroundColor: Colors.green,
                          ),
                          Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'To',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                width: width * 0.38,
                                child: customDropDownMenu(currencies, to, (val) {
                                  setState(() {
                                    to = val;
                                  });
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60,30, 60, 40),
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: '  Amount',
                            suffixIcon: Icon(
                              Icons.attach_money,
                            ),
                          ),
                        ),
                      ),

                      CustomButton(
                        text: 'Calculate',
                        width: width * 0.6,
                        height: height * 0.07,
                        buttonColor: Colors.green,
                        textColor: Colors.white,
                        function: () {
                          setState(() {
                            currencyCubit.convertCurrency(
                                from!.toString(),
                                double.parse(amountController.text),
                                to!.toString());
                          });},),


                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          'Exchange Rate',
                          style: TextStyle(color: Colors.white, fontSize: 29,fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                                currencyCubit.currencyHub?.approxResult! == null
                                    ? '0'
                                    : currencyCubit.currencyHub!.approxResult!.toString())),
                        height: height * 0.06,
                        width: width * 0.41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
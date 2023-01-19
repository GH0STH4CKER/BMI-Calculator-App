import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math' as math;

class bmi_calc extends StatefulWidget {
  const bmi_calc({Key? key}) : super(key: key);

  @override
  State<bmi_calc> createState() => _bmi_calcState();
}

class _bmi_calcState extends State<bmi_calc> {

  int height = 150;
  int weight = 70;
  String gender = 'M';
  //double leftMargin = 0;

  late double bmi = calcBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        leading: Image.asset('assets/bmi_appbar.png')//Icon(Icons.health_and_safety,size: 30,)
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      gender = 'M';
                    });
                  },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: gender == 'M'? Color(0x44AAC4E3) : Color(0xFFFFFFFF),
                  ),
                  width: MediaQuery.of(context).size.width/2.8,
                  margin: const EdgeInsets.only(left: 14),
                  child:Column(
                    children: const [
                      Text('Male',style: TextStyle(fontSize: 20,),),
                      Icon(Icons.male,size: 110,color: kTColorBlue,),
                  ],
                ))),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      gender = 'F';
                    });
                  },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: gender == 'F'? Color(0x44E3AAB3) : Color(0xFFFFFFFF),
                  ),
                  width: MediaQuery.of(context).size.width/2.8,
                  margin: const EdgeInsets.only(right: 14),
                  child: Column(
                    children: const [
                      Text('Female',style: TextStyle(fontSize: 20),),
                      Icon(Icons.female,size: 110,color: kTColorPink,),
                  ],
                )))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Row(
              children: [
                Container(
                    width: 150,
                    margin: EdgeInsets.only(left: 12),
                child:Column(
                  children: [
                    const Text('Height (cm)',style: TextStyle(fontSize: 20),),
                    Text('$height',style: const TextStyle(fontSize: 62,fontWeight: FontWeight.normal,color: kTColorNum)),
                    Row(
                      children: [
                        const SizedBox(width: 14,),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              if (height>137){height--;}
                              bmi = calcBMI(height: height, weight: weight);
                            });
                          },splashColor: Colors.lightBlueAccent,backgroundColor: kPlusMinusBtnColor, child: Icon(Icons.remove,size: 30,)),
                        const SizedBox(width: 12,),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              if (height<210){height++;}
                              bmi = calcBMI(height: height, weight: weight);
                            });
                          },splashColor: Colors.lightBlueAccent,backgroundColor: kPlusMinusBtnColor, child: Icon(Icons.add,size: 30,))
                      ],
                    )
                  ],
                )),
                Spacer(),
                Container(
                    width: 150,
                    margin: EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    const Text('Weight (kg)',style: TextStyle(fontSize: 20),),
                    Text('$weight',style: const TextStyle(fontSize: 62,fontWeight: FontWeight.normal,color: kTColorNum),),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              if (weight>30){weight--;}
                              bmi = calcBMI(height: height, weight: weight);
                            });
                          },splashColor: Colors.lightBlueAccent,backgroundColor: kPlusMinusBtnColor,child: Icon(Icons.remove,size: 30,),),
                        SizedBox(width: 12,),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              if (weight<300){weight++;}
                              bmi = calcBMI(height: height, weight: weight);
                            });
                          },splashColor: Colors.lightBlueAccent,backgroundColor: kPlusMinusBtnColor, child: Icon(Icons.add,size: 30,))
                      ],
                    )
                  ],
                ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 24),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bmi.toStringAsFixed(2),style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 70,
                    color: getResult(bmi)[1] == 'OB2'? Color(0xFFCC0A0A) :
                    getResult(bmi)[1] == 'OB'? Color(0xFFDA3C21) :
                    getResult(bmi)[1] == 'OW' ? Color(0xFFE7681D) : getResult(bmi)[1] == 'UW' ? Color(
                        0xFF2899D8) : Color(0xFF2BB92B)
                ),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getResult(bmi)[0],style: TextStyle(fontSize: 24),)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width*0.75,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFFCC0A0A),
                        Colors.red,
                        Colors.orange,
                        Colors.green,
                        Colors.green,
                        Colors.cyan,
                        Colors.cyan
                      ],
                    )
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: bmi>39 ? 270/30*39-80 : bmi <= 9.8 ? 270/30*9.8-80 : 270/30*bmi-80,),
                  child: Transform.rotate(
                      angle: 270 * math.pi / 180,
                      child: RawMaterialButton(onPressed: null, child: Icon(Icons.play_arrow,size: 40,color: Colors.indigo,))
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  double calcBMI({required int height, required int weight})
  {
    double heightM = height/100;
    return weight/(heightM*heightM);
  }

  static List getResult(bmi)
  {
    String bmiout = '';
    if (bmi >= 35){
      bmiout = 'OB2';
      return ['Obese 2',bmiout];
    }else if (bmi > 30) {
      bmiout = 'OB';
      return ['Obese',bmiout];
    }else if (bmi >= 25){
      bmiout = 'OW';
      return ['Overweight',bmiout,];
    }else if (bmi > 18.5){
      bmiout = 'N';
      return ['Normal',bmiout];
    }else{
      bmiout = 'UW';
      return ['Underweight',bmiout];
    }
  }



}

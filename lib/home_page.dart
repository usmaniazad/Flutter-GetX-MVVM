import 'package:demoproject/routes/health_routes_constant.dart';
import 'package:demoproject/view/widget/health_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children:  [
                  Container(
                    margin: const EdgeInsets.only(top:70),
                    child: const Text('Health Doctor',style: TextStyle(fontSize: 32,fontWeight:
                    FontWeight.bold,color: Colors.lime),),
                  ),
                  Image.asset('assets/images/signin.png',scale: 1.2,),
                   const SizedBox(height: 30,),
                  const SizedBox(
                    height: 50,
                    width: 190,
                    child: Text('Find What Suits Your Needs',style: TextStyle(fontSize: 22,fontFamily:'Montserrat'
                        ,fontWeight: FontWeight.w600,color: Color(0XFF707070)),textAlign:TextAlign.center,),
                  ),
                  const SizedBox(height: 5,),
                  const Text('Lorem ipsum is simply dummy text',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.normal,color: Color(0xFF707070),fontSize:15),),
                  const SizedBox(height: 40,),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal:18),
                      child: HealthButton(label: 'SIGN IN',onTap: (){

                    },color: Color(0XFFC52C32),),
                  ),
                  const SizedBox(height:10,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    child: HealthButton(label: 'CREATE AN ACCOUNT',onTap: (){
                      Get.toNamed(RouteConstant.SIGNUPROUTES);
                    },color: Color(0XFF707070),),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
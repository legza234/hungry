import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/card/view/card_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderHistory/view/order_history_view.dart';

import 'features/auth/profile/profile_veiw.dart';





class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
late PageController controller ;
 late List <Widget> screens ;
int currentScreen =0 ;

@override
  void initState() {

screens =[
  HomeView(),
  CardView(),
  OrderHistoryView(),
  ProfileView(),


];
controller =PageController(initialPage: currentScreen);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: PageView(
        controller:controller ,
        children: screens ,
        physics: NeverScrollableScrollPhysics(),

      ),


        bottomNavigationBar: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColor.Primru,
            borderRadius: BorderRadius.circular(15),
          ),







          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade500.withOpacity(0.7),
            selectedIconTheme: IconThemeData(size: 30),
            unselectedIconTheme: IconThemeData(size: 24),

            currentIndex: currentScreen,  // 👈 أهم سطر

            onTap: (index){
              setState(() {
                currentScreen = index;
              });

              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },

            items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.local_restaurant), label: 'Order History'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
            ],
          ),
        )





    );
  }
}
















































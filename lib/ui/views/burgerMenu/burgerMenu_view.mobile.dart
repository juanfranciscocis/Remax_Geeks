import 'package:provider/provider.dart';
import 'package:remax_geeks/ui/common/app_colors.dart';
import 'package:remax_geeks/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:remax_geeks/ui/views/address/address_view.dart';
import 'package:remax_geeks/ui/views/getToKnowUS/getToKnowUs_view.dart';
import 'package:remax_geeks/ui/views/learnMore/learnMore_view.dart';
import 'package:remax_geeks/widgets/landingPage/LandingPageMobileSite.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/getLearnMorePaths.dart';
import '../../../models/article.dart';
import '../../../providers/costumerProvider.dart';
import '../../../providers/dbProvider.dart';
import '../../../providers/sellFormProvider.dart';
import '../../../services/authEmailPassword.dart';
import '../../../services/authFacebook.dart';
import '../../../services/authGoogle.dart';
import '../../../widgets/landingPage/MainMobileNavBar.dart';
import '../../common/app_constants.dart';
import '../../common/app_strings.dart';
import '../addPhoneNumber/addPhoneNumber_view.dart';
import '../customService/customService_view.dart';
import '../fullService/fullService_view.dart';
import '../signUp/signUp_view.desktop.dart';
import '../signUp/singUp_view.dart';
import 'burgerMenu_viewmodel.dart';

class BurgerMenuViewMobile extends StatefulWidget {
  const BurgerMenuViewMobile({super.key});

  @override
  State<BurgerMenuViewMobile> createState() => _BurgerMenuViewMobileState();
}

class _BurgerMenuViewMobileState extends State<BurgerMenuViewMobile> {

  List<String> paths = [];

  late List<Article> articles=[];

  void initState() {
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    paths = getLearnMorePaths();
    articlesInit();
    super.initState();
  }

  Future<void> articlesInit() async {
    DBProvider db = Provider.of<DBProvider>(context, listen: false);
    await db.getArticles();
    setState(() {
      articles = db.articles;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        child: Card(
                          color: primaryCardColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              verticalSpaceLarge,
                              _buildMaterialButton(title: 'LEARN MORE',textSize: 20, onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LearnMoreView()),
                                );
                              }, isPressed: false),
                              verticalSpaceMedium,
                              _buildMaterialButton(title: 'GET TO KNOW US',textSize: 20, onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const GetToKnowUsView()));
                              }, isPressed: false),
                              verticalSpaceLarge,
                            ],
                          ),

                        ),
                      ),
                    ),
                    verticalSpaceLarge,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpaceLarge,
                        _buildMaterialButton(title: 'Sell Now',textSize: 20, onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddressView()),
                          );
                        }, isPressed: false),
                        verticalSpaceMedium,
                        _buildMaterialButton(title: 'Buy Now',textSize: 20, onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const GetToKnowUsView()));
                        }, isPressed: false),
                        verticalSpaceLarge,
                      ],
                    ),
                    verticalSpaceMedium,
                    MaterialButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_back_ios,color: fontWhiteColor,),
                      ),
                      height: 50,
                      //round the corners of the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 5.0,
                      color: primaryButtonColor,

                    )



                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildMaterialButton({
    required String title,
    required VoidCallback onPressed,
    required bool isPressed,
    Color? buttonColor,
    double? textSize,
  }) {
    final Color? pressedColor =pressedButtonColor;
    return MaterialButton(
      height: 50,
      //round the corners of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      onPressed: onPressed,
      color: isPressed ? pressedColor : buttonColor ?? primaryButtonColor,
      textColor: fontWhiteColor,
      child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontOutfitBold,
            fontSize: textSize ?? ( textSize = 15),
          ),
        ),
      ),
    );
  }





}


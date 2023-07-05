
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:provider/provider.dart';
import 'package:remax_geeks/providers/sellFormProvider.dart';

import '../services/realtyMoleService.dart';
import '../services/zillowService.dart';
import '../ui/common/app_strings.dart';
import '../ui/views/chooseServiceType/chooseServiceType_view.dart';

  Future<String> getCaptcha() async {
    String token = await GRecaptchaV3.execute('submit') ?? 'NULL';
    return token;
  }

  Future<void> navigate(BuildContext context)async{
    //CHECK FOR CAPTCHA TOKEN

    if (await getCaptcha() == 'NULL'){
      return;
    }
    // VERIFY ADDRESS, BUTTONS PRESS AND GO TO NEXT PAGE
    SellFormProvider sellFormProvider = Provider.of<SellFormProvider>(context, listen: false);
    if (sellFormProvider.address != '' && sellFormProvider.condition != '' && sellFormProvider.type != '') {
      RealtyMoleService realty = RealtyMoleService();
      await realty.getPrice(sellFormProvider.address);
      ZillowService zillow = ZillowService();
      await zillow.getPrice(sellFormProvider.address);
      List<double> prices = [0,0];
      prices[0] = zillow.price;
      prices[1] = realty.price;
      sellFormProvider.apiPrices = prices;
      // GO TO NEXT PAGE
      Navigator.of(context).pushNamed("/chooseService");

    } else {
      // SHOW ERROR MESSAGE
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill all the fields',
            style: TextStyle(
              fontFamily: fontOutfitRegular,
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }

  }


import 'package:gardamedicatest/shared/network/cache_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository{
  

  Future<bool> checkIfUserHasOnboarded()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    var result = sp.getBool(CacheConst.ONBOARD);
    if(result!=null)return result;
    else return false;
  }
  Future<void> userOnboarded()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool(CacheConst.ONBOARD,true);
  }
}
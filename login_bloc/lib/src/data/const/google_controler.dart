import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class logincontroller extends GetxController {
  var _googleSingnin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  
  login() async {
    googleAccount.value = await _googleSingnin.signIn();
  }
}

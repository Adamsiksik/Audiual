import 'dart:async';

class Valid {

  final validEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') && email.contains('.')) {
      sink.add(email);
    } else {
      sink.addError('Enter Valid Email');
    }
  });
  final validPass =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length >= 6) {
      sink.add(pass);
    } else {
      sink.addError('Your Password Should Be More Than 6 Charachters');
    }
  });
}

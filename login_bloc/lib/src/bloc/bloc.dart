import 'dart:async';

import 'valid.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Valid {
  final _emailCont = StreamController<String>.broadcast();
  final _passCont = StreamController<String>.broadcast();
    final _passCont2 = StreamController<String>.broadcast();


  Stream<String> get emailStream => _emailCont.stream.transform(validEmail);
  Stream<String> get passwordStream => _passCont.stream.transform(validPass);
   Stream<String> get passwordStream2 => _passCont.stream.transform(validPass);


  Stream<bool> get submitValid =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

      Stream<bool> get subval =>
      Rx.combineLatest3(emailStream, passwordStream,passwordStream2, (e,p,p2) => true);


  Function(String) get changeEmail => _emailCont.sink.add;
  Function(String) get changePass => _passCont.sink.add;
  Function(String) get changePass2 => _passCont2.sink.add;


  dispose() {
    _emailCont.close();
    _passCont.close();
  }
}

final bloc = Bloc();

import 'package:byneetcourseapp/src/modules/account/mycourse_repository.dart';
import 'package:byneetcourseapp/src/modules/course/models/materi_model.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/modulDrawerItems.dart';
import 'package:byneetcourseapp/src/modules/course/services/materi_repository.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingModule extends StatelessWidget {
  final String idCourse;

  const LoadingModule({Key key, @required this.idCourse}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final materiprov = Provider.of<MateriRepository>(context, listen: false);
    final mycourseprov =
        Provider.of<MyCourseRepository>(context, listen: false);
    final user = Provider.of<LoginService>(context);

//tuk persinggahan.. jadi bende nin, ngeget semue materi lok, nanti disimpan di DBsqlite
//jadi mun data nye banyak kan get nye agak lama, nampilkan loading am,..
//tuk selanjutnye, dak perlu get ke server gim, cukup get ke db sqlite(ini masih rencane, belom bljr sqlite ak wkwkw)
    return FutureBuilder<List<MateriModel>>(
        future: materiprov.getState(idCourse),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            mycourseprov.getOneData(user.user.uid, idCourse);
            return ModulDrawerItem(listMateri: snapshot.data);
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Memuat data Materi...')
                ],
              ),
            ),
          );
        });
  }
}

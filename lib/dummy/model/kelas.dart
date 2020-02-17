import 'package:byneetcourseapp/dummy/model/screenshot.dart';
import 'package:byneetcourseapp/dummy/model/theory.dart';

class Kelas {
  final String uid; // id kelas
  final String title; // judul kelas
  final String urlimage; // url gambar kelas
  final String classStatus; // status kelas premium atau gratis
  final String description; // deskripsi kelas
  final String creatorName; // nama creator == yang buat kelas == pemateri
  final int rating; // rating kelas
  final String date; // tanggal dibuat kelas
  final List<Screenshot> screenshots; // list gambar screenshot
  final List<Theory> theories; // list data teori

  Kelas({
    this.uid,
    this.title,
    this.urlimage,
    this.classStatus,
    this.description,
    this.creatorName,
    this.rating,
    this.date,
    this.screenshots,
    this.theories,
  });
}

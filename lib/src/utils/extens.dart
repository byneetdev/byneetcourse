// extension BuildKeyword on String {
//   List <String>> buildKeyword(){
//   }
// }

List<String> buildKeyword(String data) {
  List<String> list = [];
  for (var i = 1; i < data.length + 1; i++) {
    list.add(data.substring(0, i));
  }
  return list;
}

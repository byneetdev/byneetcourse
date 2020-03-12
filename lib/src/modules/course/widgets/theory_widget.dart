import 'package:byneetcourseapp/src/modules/course/models/theory_model.dart';
import 'package:flutter/material.dart';

class TheoryWidget extends StatelessWidget {
  final List<Theory> theory;
  TheoryWidget({this.theory});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: theory.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) => EntryItem(theory[index]),
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Theory entry;

  Widget _buildTiles(Theory root, BuildContext context) {
    if (root.items.isEmpty) return ListTile(title: Text(root.title));
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        bottom: 10,
      ),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ExpansionTile(
          key: PageStorageKey<Theory>(root),
          title: Text(
            root.title,
            style: TextStyle(
              color: Color(0xFFFB1002),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: root.items.map((e) {
            return ListTile(
              onTap: () {
                //! not work
                //? mau ke view belajar pencet beli sekarang / lanjut belajar
                //? file nya ada di course detail widget claim card
                //?
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ExamView(),
                //     ));
              },
              leading: Icon(Icons.lock),
              title: Text(
                e.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry, context);
  }
}

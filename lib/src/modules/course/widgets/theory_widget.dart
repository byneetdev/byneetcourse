import 'package:byneetcourseapp/src/modules/course/models/theory_model.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
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

  Widget _buildTiles(Theory root) {
    if (root.items.isEmpty) return ListTile(title: Text(root.title));
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        bottom: 10,
      ),
      child: ClayContainer(
        color: Color(0xFFD2E0EF),
        borderRadius: 15,
        child: ExpansionTile(
          backgroundColor: Color(0xFFD2E0EF),
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
              leading: Icon(Icons.lock),
              title: Text(e.title),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

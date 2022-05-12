import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart ';
import 'package:untitled/fruit.dart';

import 'formgridview.dart';


List<String> list = ["a", "s", "c", "b", "d", "g", "e5"];


class frul {

}

class MyListViewPage extends StatefulWidget {
  const MyListViewPage({Key? key}) : super(key: key);

  @override
  State<MyListViewPage> createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<MyListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: const [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: null,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const ListTile(title: Text('Slide me')),
            );
            return ListTile(
                trailing: Icon(Icons.sailing),
                title: Text(list[index]),
                leading: Icon(Icons.account_box_rounded),
                subtitle: Text("Cửa hàng thầy tuấn anh"));

            // test

          },
          separatorBuilder: (context, index) => Divider(
            thickness: 2,
          ),
          itemCount: list.length),
    );
  }
}

// dùng phương thức map với đầu vào là 1 string, đầu ra trả về một widget
// card


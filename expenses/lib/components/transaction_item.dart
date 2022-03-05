import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';

class TransationItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransationItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${tr.value}'),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MM y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => onRemove(tr.id),
                icon: Icon(Icons.delete),
                label: Text('Excluir'))
            : IconButton(
                onPressed: () => onRemove(tr.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor),
      ),
    );
  }
}
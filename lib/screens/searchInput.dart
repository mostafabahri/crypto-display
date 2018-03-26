import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SearchInput extends StatelessWidget {
  final onChanged;

  SearchInput({@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        children: [
          new Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 10.0),
            child: new Icon(Icons.search),
          ),
          new Expanded(
            child: new TextField(
              onChanged: this.onChanged,
            ),
          )
        ],
      ),
    );
  }
}

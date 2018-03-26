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
            padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 5.0),
            child: new Icon(Icons.search),
          ),
          new Expanded(
            child: new Padding(//todo : better alignment
              padding: const EdgeInsets.only(left: 18.0),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: 'Search name or symbol...',
                  border: InputBorder.none
                ),
                onChanged: this.onChanged,
              ),
            ),
          )
        ],
      ),
    );
  }
}

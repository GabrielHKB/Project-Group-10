

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/imat/product.dart';
import '../model/imat_data_handler.dart';
import '../pages/main_view.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var iMat = Provider.of<ImatDataHandler>(context, listen: false);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CupertinoSearchTextField(
          placeholder: 'Sök…',
          backgroundColor: CupertinoColors.white,
          prefixIcon: Icon(
              CupertinoIcons.search, color: CupertinoColors.systemGrey),
          onChanged: (text) {
            // live search logic here
            if (ModalRoute.of(context)?.settings.name == '/home');
            iMat.selectSelection(iMat.findProducts(text));
          },
          onSubmitted: (text) {
            if ((ModalRoute.of(context)?.settings.name == '/history') | (ModalRoute.of(context)?.settings.name == '/account'));
            _showMainView(context);
            iMat.selectSelection(iMat.findProducts(text));
          },
        ),
      ),
    );
  }
}

void _showMainView(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MainView()),
  );
}
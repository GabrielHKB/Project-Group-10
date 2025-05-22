import 'package:api_test/app_theme.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/contact_us_view.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/pages/oversights_view.dart';
import 'package:api_test/widgets/main_header.dart';
import 'package:flutter/material.dart';

class MyPagesView extends StatefulWidget {

  const MyPagesView({super.key});

  @override
  State<MyPagesView> createState() => _MyPagesViewState();

}

class _MyPagesViewState extends State<MyPagesView> {

  String selectedTab = 'oversights';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(

        children: [

          main_header(),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tabSelectionPanel(),
                Expanded(
                  child: _renderSelectedTab(),
                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

  Widget _tabSelectionPanel() {

    return Container(

      width: 500,

      color: const Color(0xFFB5B5B5),

      child: Column(

        children: [

          _tabButton('oversights', 'Översikt'),
          _tabButton('purchaseHistory', 'Köphistorik'),
          _tabButton('accountSettings', 'Kontoinställningar'),
          _tabButton('contactUs', 'Kontakta Oss'),

        ],

      ),

    );

  }

  Widget _tabButton(String key, String label) {

    final bool isSelected = selectedTab == key;

    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),

      child: InkWell(

        borderRadius: BorderRadius.circular(12),

        // why is this not working? refer to older labs and check inkwell
        hoverColor: AppTheme.colorScheme.primary.withAlpha(20),
        splashColor: AppTheme.colorScheme.primary.withAlpha(40),

        onTap: () {
          setState(() {
            selectedTab = key;
          });

        },

        child: Container(

          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),

          decoration: BoxDecoration(

            color: isSelected ? const Color(0xFFCC4D3D) : const Color(0xFFEAEAEA),

            borderRadius: BorderRadius.circular(12),

            boxShadow:

            isSelected ?
            [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ]

                :

            [],

          ),

          child: Center(

            child: Text(

              label,

              style: TextStyle(
                fontSize: 38,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                color: isSelected ? Colors.white : Colors.grey[600],

              ),

            ),

          ),

        ),

      ),

    );

  }

  Widget _renderSelectedTab() {

    switch (selectedTab) {

      case 'oversights':
        return Center(child: OversightsView());

      case 'purchaseHistory':
        return Center(child: HistoryView());

      case 'accountSettings':
        return Center(child: AccountView());

      case 'contactUs':
        return Center(child: ContactUsView());

      default:
        return Center(child: Text('Ingen flik vald'));
    }

  }

}
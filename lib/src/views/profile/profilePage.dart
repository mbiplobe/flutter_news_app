import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/commonWidget/customWidget.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/view_models/theme_state_view_model.dart';

class ProfilePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfileWidgetState();
  }
}

class _ProfileWidgetState extends ConsumerState<ProfilePage> {
  Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              count,
              style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(text, style: AppTheme.h5Style),
          ],
        ),
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                  'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg',
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Md. Mujahid Islam',
                    style: AppTheme.h2Style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('mbiplobe@gmail.com', style: AppTheme.h5Style),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          Divider(height: 5, thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _settingRow(
    BuildContext context,
    IconData icon1,
    String text,
    bool isEnable, {
    Color color = Colors.black,
    int index = 0,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(icon1),
              SizedBox(width: 10),
              Text(
                text,
                style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logout(BuildContext context, IconData icon1, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon1,
            color: Theme.of(context).colorScheme.error.withAlpha(200),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: AppTheme.h3Style.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.error.withAlpha(200),
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(themStateProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        minimum: EdgeInsets.all(8),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(child: _headerWidget(context)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Column(
                  children: [
                    _settingRow(
                      context,
                      Icons.account_circle,
                      'Profile',
                      value,
                      index: 1,
                    ),

                    _settingRow(
                      context,
                      Icons.notifications,
                      'Notification',
                      false,
                      index: 2,
                    ),

                    _settingRow(context, Icons.share, 'Social Media', false),
                    SizedBox(height: 5),
                    Divider(indent: 20, endIndent: 20, height: 0),
                    SizedBox(height: 5),
                    _logout(context, Icons.exit_to_app, 'Logout'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

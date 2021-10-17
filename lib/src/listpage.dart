import 'package:flutter/material.dart';
import 'values.dart' as av;
import 'error_page.dart';
import 'loading_dialog.dart';
import 'avicennas.dart' as av;

enum ListStatus {
  init,
  empty,
  error,
  normal
}

class ListPage extends StatelessWidget {
  ListPage({
    required this.onRefresh,
    required this.children
  }) : super ();

  final Future<void> Function() onRefresh;
  final List<Widget> children;

  final ListStatus _listStatus = ListStatus.init;

  @override
  Widget build(BuildContext context) {
    switch (_listStatus) {
      case ListStatus.init:
        return Center(child: Loading());
      case ListStatus.empty:
        return ErrorPage(
          message: 'No profile yet!\nclick the buttons below to create or import profile',
          assetPath: 'assets/images/empty.png',
          imageWidth: 0.8,
          action: av.IconButton(
            tooltip: 'Refresh',
            onTap: onRefresh,
            icon: Icon(Icons.refresh),
          )
        );
      case ListStatus.error:
        return ErrorPage(
          message: 'Error',
          assetPath: 'assets/images/empty.png',
          imageWidth: 0.8,
          action: av.IconButton(
            tooltip: 'Refresh',
            onTap: onRefresh,
            icon: Icon(Icons.refresh),
          )
        );
      case ListStatus.normal:
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 48),
              child: RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 20),
                  children: children,
                ),
              )
            ),
            Container(
              color: av.Colors.background,
              padding: EdgeInsets.only(left: 18, top: 0, right: 12, bottom: 18),
              width: MediaQuery.of(context).size.width,
              child: Text('Tap + to add new profile or tap on download icon to import profile. Tap on profile to send and hold to edit'),
            )
          ],
        );
    }
  }

}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sopra_aqui/providers/main.dart';
import 'package:sopra_aqui/themes/colors.dart';
import 'package:sopra_aqui/widgets/about_bottom_sheet.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child, this.actionRefreshButton});

  final Widget child;
  final Future<void> Function()? actionRefreshButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'SOPRA AQUI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => AboutBottomSheet());
                  },
                  icon: Image.asset(
                    'assets/images/info.png',
                    width: 18,
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.gray)),
                ),
                IgnorePointer(
                  ignoring:     context.watch<MainProvider>().isRefreshing,
                  child: IconButton(
            
                  onPressed: () async {
                    if (actionRefreshButton == null ||
                        context.read<MainProvider>().isRefreshing) {
                        return;}
                    context.read<MainProvider>().isRefreshing = true;

                    await actionRefreshButton!();
                    context.read<MainProvider>().isRefreshing = false;
                  },
                  icon: Image.asset(
                    context.watch<MainProvider>().isRefreshing
                        ? 'assets/images/load-black.gif'
                        : 'assets/images/reload.png',
                    width: 18,
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.gray)),
                ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(child: child)
          ],
        ),
      )),
    ));
  }
}

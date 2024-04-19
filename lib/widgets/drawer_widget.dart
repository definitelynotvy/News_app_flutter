import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/providers/theme_provider.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}): super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = Utils(context).getColor;
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                  child: Image.asset('assets/images/newspaper.png',
                  height: 60,
                  width: 60,
                  ),
                  ),
                  const VerticalSpacing(20),
                  Flexible(
                    child: Text(
                      'News App', 
                      style: GoogleFonts.lobster(
                        textStyle: const TextStyle(fontSize: 20, letterSpacing: 0.6)
                      ),)),
                  ],),
            ),
            const VerticalSpacing(20),
            ListTilesWidget(
              label: "Home",
              icon: IconlyBold.home,
              fct: () {},
            ),
            ListTilesWidget(
              label: "Bookmark",
              icon: IconlyBold.bookmark,
              fct: () {},
            ),
            const Divider(
              thickness: 5,
            ),
            SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
                style: TextStyle(color: color,fontSize: 20),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
                
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              }),
          ],
        ),
      )
    );
  }
}

class ListTilesWidget extends StatelessWidget {
  const ListTilesWidget({
    Key? key, required this.label, required this.fct, required this.icon,
  }) : super(key: key);
  final String label;
  final Function fct;
  final IconData icon;
  
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
        
      ),
      title: Text(
        label,
        style:  TextStyle(color: color ,fontSize: 20),
      ),
      onTap: () {
        fct();
      },
    );
  }
}
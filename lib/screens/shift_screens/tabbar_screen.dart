import 'package:flutter/material.dart';
import 'package:password_generator/screens/charts/bar_chart_screen.dart';
import 'package:password_generator/screens/charts/line_chart_screen.dart';
import 'package:password_generator/screens/charts/pie_chart_screen.dart';
import 'package:password_generator/widgets/widget_utils.dart';


class TabPageScreen extends StatefulWidget {
  const TabPageScreen({Key? key}) : super(key: key);

  @override
  _TabPageScreenState createState() => _TabPageScreenState();
}

class _TabPageScreenState extends State<TabPageScreen> {
  @override
  Widget build(BuildContext context) {
    return UtilsWidgets.tabBar(
      'Charts',
      const [
        Tab(icon: Icon(Icons.bar_chart), text: 'BarChart'),
        Tab(icon: Icon(Icons.stacked_line_chart), text: 'LineChart'),
        Tab(icon: Icon(Icons.pie_chart), text: 'PieChart'),
      ],
      [
        const BarChartDemo(),
        const LineChartDemo(),
        const PieChartDemo(),
      ],
    );
  }
}

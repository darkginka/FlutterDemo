import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/widgets/widget_decoration.dart';

class PieChartDemo extends StatefulWidget {
  const PieChartDemo({Key? key}) : super(key: key);

  @override
  _PieChartDemoState createState() => _PieChartDemoState();
}

class _PieChartDemoState extends State<PieChartDemo> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: TextButton.icon(
        //     onPressed: () {},
        //     icon: const Icon(Icons.access_alarm),
        //     label: const Text('Chart'),
        //   ),
        // ),
        body: Row(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DecorateWidgets.indicator(Colors.black, 'First', true),
              DecorateWidgets.indicator(
                Color(0xff0293ee),
                'First',
                true,
              ),
              SizedBox(
                height: 4,
              ),
              DecorateWidgets.indicator(
                Color(0xfff8b250),
                'Second',
                true,
              ),
              SizedBox(
                height: 4,
              ),
              DecorateWidgets.indicator(
                Color(0xff845bef),
                'Third',
                true,
              ),
              SizedBox(
                height: 4,
              ),
              DecorateWidgets.indicator(
                Color(0xff13d38e),
                'Fourth',
                true,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({super.key});

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: screenHeight * 0.1),
          PieChart(
            dataMap: const {
              'Total': 100,
              'Recovered': 30,
              'Deaths': 20,
            },
            animationDuration: const Duration(microseconds: 50),
            chartType: ChartType.ring,
            colorList: const [
              Colors.blue,
              Colors.green,
              Colors.red,
            ],
            chartRadius: screenWidth / 3.2,
            legendOptions: const LegendOptions(
              legendPosition: LegendPosition.left,
              legendShape: BoxShape.rectangle,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ReuseableRow(title: 'Pakistan', value: '47'),
                  ReuseableRow(title: 'Pakistan', value: '47'),
                  ReuseableRow(title: 'Pakistan', value: '47'),
                  ReuseableRow(title: 'Pakistan', value: '47'),
                  ReuseableRow(title: 'Pakistan', value: '47'),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}

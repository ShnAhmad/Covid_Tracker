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
      backgroundColor: const Color.fromARGB(49, 238, 238, 238),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              // Pie Chart Section
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "COVID-19 Statistics",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      PieChart(
                        dataMap: const {
                          'Total': 100,
                          'Recovered': 30,
                          'Deaths': 20,
                        },
                        animationDuration: const Duration(milliseconds: 800),
                        chartType: ChartType.ring,
                        colorList: const [
                          Colors.blue,
                          Colors.green,
                          Colors.red,
                        ],
                        chartRadius: screenWidth / 2.8,
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          chartValueBackgroundColor: Colors.transparent,
                          chartValueStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendShape: BoxShape.circle,
                          showLegendsInRow: false,
                          legendTextStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              // Information Section
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Country Details",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          ReuseableRow(title: 'Pakistan', value: '47'),
                          ReuseableRow(title: 'India', value: '85'),
                          ReuseableRow(title: 'USA', value: '120'),
                          ReuseableRow(title: 'UK', value: '76'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                          ReuseableRow(title: 'Brazil', value: '54'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}

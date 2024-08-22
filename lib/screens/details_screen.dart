import 'package:covid_tracker/screens/states_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String image, name;
  int totalCases,
      totalDeaths,
      todayRecovered,
      active,
      critical,
      tests,
      recovered;
  DetailsScreen(
      {super.key,
      required this.active,
      required this.critical,
      required this.image,
      required this.name,
      required this.tests,
      required this.todayRecovered,
      required this.totalCases,
      required this.totalDeaths,
      required this.recovered});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      ReuseableRow(
                          title: 'Cases', value: widget.totalCases.toString()),
                      ReuseableRow(
                          title: 'Recoverd',
                          value: widget.recovered.toString()),
                      ReuseableRow(
                          title: 'Deaths',
                          value: widget.totalDeaths.toString()),
                      ReuseableRow(
                          title: 'Active', value: widget.active.toString()),
                      ReuseableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReuseableRow(
                          title: 'Tests', value: widget.tests.toString()),
                      ReuseableRow(
                          title: 'TodayRecoverd',
                          value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}

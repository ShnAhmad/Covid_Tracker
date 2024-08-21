import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/screens/countries_list_screen.dart';
import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    StatesServices statesServices = StatesServices();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(49, 238, 238, 238),
      body: SafeArea(
        child: FutureBuilder(
            future: statesServices.fetchWorldStatesApi(),
            builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
              if (!snapshot.hasData) {
                return const Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                    ));
              } else {
                return Padding(
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
                                dataMap: {
                                  'Total': double.parse(
                                      snapshot.data!.cases.toString()),
                                  'Recovered': double.parse(
                                      snapshot.data!.recovered.toString()),
                                  'Deaths': double.parse(
                                      snapshot.data!.deaths.toString()),
                                },
                                animationDuration:
                                    const Duration(milliseconds: 800),
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
                                    color: Colors.white,
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
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    " Details",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ReuseableRow(
                                    title: 'Total',
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'AffectedCountries',
                                    value: snapshot.data!.affectedCountries
                                        .toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'TodayCases',
                                    value: snapshot.data!.todayCases.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'TodayDeaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'TodayRecovere',
                                    value: snapshot.data!.todayRecovered
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CountriesListScreen())),
                        child: Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.8,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 19, 162, 33),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: const Center(
                              child: Text(
                            'Track Countries',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                    ],
                  ),
                );
              }
            }),
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

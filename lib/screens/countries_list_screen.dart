import 'package:covid_tracker/screens/details_screen.dart';
import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  StatesServices statesServices = StatesServices();

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Countries'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _textEditingController,
                focusNode: _focusNode,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                    hintText: 'Search country with name',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(49))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.fetchCountriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: ListTile(
                            leading: Container(
                                height: 20, width: 90, color: Colors.white),
                            title: Container(
                                height: 10, width: 90, color: Colors.white),
                            subtitle: Container(
                                height: 10, width: 90, color: Colors.white),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (_textEditingController.text.isEmpty) {
                          return InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          active: snapshot.data![index]
                                              ['active'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          name: snapshot.data![index]
                                              ['country'],
                                          tests: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          recovered: snapshot.data![index]
                                              ['recovered'],
                                        ))),
                            child: ListTile(
                              leading: Image.network(
                                  height: 50,
                                  width: 50,
                                  snapshot.data![index]['countryInfo']['flag']),
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                            ),
                          );
                        } else if (name.toLowerCase().contains(
                            _textEditingController.text.toLowerCase())) {
                          return InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          active: snapshot.data![index]
                                              ['active'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          name: snapshot.data![index]
                                              ['country'],
                                          tests: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          recovered: snapshot.data![index]
                                              ['recovered'],
                                        ))),
                            child: ListTile(
                              leading: Image.network(
                                  height: 50,
                                  width: 50,
                                  snapshot.data![index]['countryInfo']['flag']),
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

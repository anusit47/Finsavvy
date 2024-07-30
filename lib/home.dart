import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/Model/coinModel.dart';
import 'package:shop/Components/item.dart';
import 'package:shop/Components/item2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isRefreshing = true;
  List? coinMarket = [];
  var coinMarketList;

  @override
  void initState() {
    super.initState();
    getCoinMarket();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(myHeight * 0.02),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(myHeight * 0.02),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      'Cyptocurrency Graph',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: myHeight * 0.02),
                    Container(
                      height: myHeight * 0.36,
                      child: isRefreshing
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 0, 157, 255),
                              ),
                            )
                          : coinMarket == null || coinMarket!.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.all(myHeight * 0.06),
                                )
                              : ListView.builder(
                                  itemCount: coinMarket!
                                      .length, // Adjust itemCount to fit the actual length
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Item(
                                      item: coinMarket![index],
                                    );
                                  },
                                ),
                    ),
                    SizedBox(height: myHeight * 0.02),
                    Row(
                      children: [
                        Text(
                          'Recommend Cyptocurrency',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: myHeight * 0.01),
                    Expanded(
                      child: isRefreshing
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 0, 157, 255),
                              ),
                            )
                          : coinMarket == null || coinMarket!.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.all(myHeight * 0.06),
                                  child: Center(
                                    child: Text(
                                      'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: coinMarket!.length,
                                  itemBuilder: (context, index) {
                                    return Item2(
                                      item: coinMarket![index],
                                    );
                                  },
                                ),
                    ),
                    SizedBox(height: myHeight * 0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefreshing = false;
    });

    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}

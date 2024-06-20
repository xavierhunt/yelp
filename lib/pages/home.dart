import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yelp_task/models/list_of_businesses.dart';
import 'package:yelp_task/pages/detailed_view.dart';
import 'package:yelp_task/service/api_service.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 138, 109, 219),
          elevation: 0.0,
          title: const Text(
            'Yelp Exercise List View',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
                // Paint a nice background color gradient for the screen.
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // I may have taken the "ZEIL" purple from the web page...
                    colors: [Colors.white, Color.fromARGB(255, 138, 109, 219)],
                  ),
                ),
                child: _body()),
          ],
        ));
  }

  FutureBuilder _body() {
    final apiService =
        ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
      future: apiService.getBusinesses(
          // I don't have a server to hide the API key on so here it is.
          // Could obfuscate a bit using SecretLoader but that doesn't stop
          // anyone finding it through decompilation.
          'Bearer gF_qESJ-xsWo0tLbmI7AlgM4XJ1ipChvZ_HW67pOrMvBuE1XmH4yDlMsSWg2TMT-5hzOMG0aErtkBD6oMsr2yc8JXaLYYAK9FJ-T684_9J_UXzw2PmDWalRfAYRyZnYx'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final ListOfBusinesses response = snapshot.data!;
          List<Business> businesses = response.businesses!;
          if (businesses.isEmpty) {
            return const Text("no data");
          } else {
            return _businesses(businesses);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _businesses(List<Business> businesses) {
    return ListView.builder(
      itemCount: businesses.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          // Tapping a list item opens the detailed view for that list item.
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailedView(business: businesses[index])));
          },
          // List item widget as a card.
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 138, 109, 219),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                leading: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24))),
                    child: Text(
                        "${double.parse((businesses[index].distance / 1000).toString()).toStringAsFixed(2)} km",
                        style: const TextStyle(color: Colors.white))),
                title: Text(
                  // Business name widget
                  businesses[index].name ?? "Name",
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Text(businesses[index].categories?[0].title ?? "Category",
                        // Business category widget
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
                trailing: RatingStars(
                  // Business star rating widget
                  valueLabelVisibility: false,
                  starOffColor: const Color.fromARGB(255, 253, 253, 253),
                  starCount: businesses[index].rating!,
                  starSize: 20,
                  starSpacing: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

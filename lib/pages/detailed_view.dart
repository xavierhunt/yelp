import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yelp_task/models/list_of_businesses.dart';

class DetailedView extends StatelessWidget {
  final Business business;
  const DetailedView({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 138, 109, 219),
          elevation: 0.0,
          title: const Text(
            'Yelp Exercise Detailed View',
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.white, Color.fromARGB(255, 138, 109, 219)],
                  ),
                ),
                child: _body()),
          ],
        ));
  }

  Widget _body() {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.white, width: 2),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 138, 109, 219),
            borderRadius: BorderRadius.circular(12)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 300,
            width: 400,
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    // Match the circular corners of the widget with the Card parent
                    borderRadius: BorderRadius.circular(12.0),
                    child: ShaderMask(
                      // Fade the bottom of the image to blend nicely and make the
                      // business name text pop out a bit more.
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        // Add a network image to the detailed view page despite
                        // the trial version of Yelp API not granting access to
                        // business images (always null)
                        imageUrl:
                            'https://miro.medium.com/v2/resize:fit:4800/format:webp/1*01NJDcfqeJ1CU1MRDp0CaQ.jpeg',
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Text(
                        // Business name widget.
                        business.name ?? "Name",
                        style: const TextStyle(
                            overflow: TextOverflow.fade,
                            fontSize: 72.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(business.categories?[0].title ?? "Category",
                  // Business category widget.
                  style: const TextStyle(color: Colors.white, fontSize: 36)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 72, 12, 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    // Business distance widget.
                    "${double.parse((business.distance / 1000).toString()).toStringAsFixed(2)} km",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36)),
                RatingStars(
                  // Business star rating widget.
                  valueLabelVisibility: false,
                  starOffColor: const Color.fromARGB(255, 247, 246, 245),
                  starCount: business.rating!,
                  starSize: 28,
                  starSpacing: 2,
                ),
                Text(business.price ?? "Price",
                    // Business price point widget.
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    // Business url widget (tapping opens url in device browser).
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.public,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            _openUrl(business.url!);
                          },
                          child: Text(business.url ?? "Url",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    // Business phone number widget (tapping opens device dialler).
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            _openDialler(business.phone!);
                          },
                          child: Text(business.phone ?? "Phone",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    // Business location widget (tapping opens maps to address).
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.place,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            _openMap(business.location!.address1.toString());
                          },
                          child: Text(business.location!.address1.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  _openMap(String displayAddress) async {
    var address = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$displayAddress');
    if (await canLaunchUrl(address)) {
      await launchUrl(address);
    } else {
      throw 'Could not launch $address';
    }
  }

  _openUrl(String businessUrl) async {
    var url = Uri.parse(businessUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not open $url";
    }
  }

  _openDialler(String businessPhone) async {
    String phoneNumber = 'tel:$businessPhone';
    var phone = Uri.parse(phoneNumber);
    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
}

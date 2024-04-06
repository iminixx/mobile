import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data.dart'; // Import data.dart yang berisi cardsData

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'WIBU',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 23,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Tambahkan logika untuk tindakan ketika gambar di tap
                },
                child: Container(
                  child: Image.network(
                    'https://images8.alphacoders.com/116/thumb-1920-1168265.png',
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  width: double.infinity,
                  height: 225,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hot Updates",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "More...",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          for (final data in comics)
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Image.network(
                                        data['coverImageUrl'] ,
                                        fit: BoxFit.cover,
                                      ),
                                      width: 100,
                                      height: 140,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: Text(
                                      data['title'] ?? '',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    data['chapter'] ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

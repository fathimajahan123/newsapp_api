// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newsapp_api/dummydb.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Let's Personalize"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("choose topics that interests you"),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                Dummydb.topics[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(),
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 10,
                                child: InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                itemCount: Dummydb.topics.length),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            height: 50,
            child: Center(child: Text("Continue")),
          )
        ],
      ),
    );
  }
}

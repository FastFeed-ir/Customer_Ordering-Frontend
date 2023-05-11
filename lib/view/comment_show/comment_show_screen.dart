import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/comment_detail.dart';

class CommentShow extends StatefulWidget {
  const CommentShow({Key? key}) : super(key: key);

  @override
  State<CommentShow> createState() => _CommentShowState();
}

class _CommentShowState extends State<CommentShow> {
  var commentCount = 3;
  var scoresNumber = 5555;
  var scoresAverage = 4.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: RedColor,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                'assets/logo_white.png',
                height: 120.0,
              ),
            ],
          ),
        ),
      ),
      body: Material(
        color: RedColor,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: TabBar(
                  tabs: const [
                    Tab(
                      child: Text(
                        'اطلاعات',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'نظرات',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const Center(
                      child: Text('This is Tab 2'),
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'نظرات',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      scoresAverage.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: scoresAverage >= 3.0
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                    Text(
                                      'از $scoresNumber امتیاز',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: commentCount,
                            itemBuilder: (context, index) {
                              return const Column(
                                children: [
                                  Divider(
                                    thickness: 2,
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                  CommentDetail(),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
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

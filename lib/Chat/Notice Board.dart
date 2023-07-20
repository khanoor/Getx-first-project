import 'package:flutter/material.dart';

class ChatNoticeBoardScreen extends StatefulWidget {
  const ChatNoticeBoardScreen({super.key});

  @override
  State<ChatNoticeBoardScreen> createState() => _ChatNoticeBoardScreenState();
}

class _ChatNoticeBoardScreenState extends State<ChatNoticeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Welcome, Mark",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue[200]),
                child: Center(
                  child: Text(
                    "Chat/Notice Board",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Threads",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200],
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "Add Post",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 600,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text(
                                      "Title here",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Comments",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.comment),
                                  Text("Comments"),
                                  SizedBox(width: 6),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

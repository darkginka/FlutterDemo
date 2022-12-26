import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  bool likebtn = false;
  String title = 'GeeksforGeeks';
  String description =
      'GeeksforGeeks is a computer science portal for geeks at geeksforgeeks.org. It contains well written, well thought and well explained computer science and programming articles, quizzes, projects, interview experienxes and much more!!';
  String url =
      "https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discussions"),
      ),
      body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 50,
                          shadowColor: Colors.black,
                          color: Color.fromARGB(255, 162, 214, 216),
                          child: SizedBox(
                            width: 370,
                            height: 500,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const ListTile(
                                    leading: Icon(Icons.verified_user),
                                    title: Text('Rohan'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // UtilsWidgets.showDialogFuncWithAction(
                                      //     context, title, description,
                                      //     url: url);
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(url),
                                      radius: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    title,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    description,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (likebtn) {
                                                likebtn = false;
                                              } else {
                                                likebtn = true;
                                              }
                                            });
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blueGrey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Row(
                                              children: [
                                                likebtn
                                                    ? Icon(Icons.thumb_up)
                                                    : Icon(
                                                        Icons.thumb_up_off_alt),
                                                Text('Like')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        child: ElevatedButton(
                                          onPressed: () => 'Null',
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blueGrey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.comment),
                                                Text('Comment')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        child: ElevatedButton(
                                          onPressed: () => 'Null',
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blueGrey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.share),
                                                Text('Share')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

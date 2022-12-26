import 'package:flutter/material.dart';

class DecorateWidgets {
  
  static Widget fieldData(String? key, String? value, BuildContext context,
      {bool isHighlight = false, Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        SizedBox(
          width: MediaQuery.of(context).size.width * 30,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: Text(
                        "Your Answer :- ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        key ?? "",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isHighlight ? Colors.white : null,
                            backgroundColor: isHighlight ? color : null),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      child: Text(
                        "Correct Answer :- ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    ),
                    SizedBox(
                        child: Text(
                      value ?? "",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          endIndent: 20,
          indent: 20,
          thickness: 1,
          color: Colors.black38,
        ),
      ],
    );
  }

 static indicator(
    Color color,
    String text,
    bool isSquare,
  ) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }

  static questionField(int index, List<String> questionList) {
    return Text(
      (index + 1).toString() + '. ' + questionList[index],
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      maxLines: 5,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailto/mailto.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:get/get.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:material_dialogs/widgets/buttons/icon_button.dart';
// import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
// import 'package:rating_dialog/rating_dialog.dart';

class UtilsWidgets {
   static tabBar(
    String title,
    List<Tab> tabs,
    List<Widget> children,
  ) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: tabs,
          ),
          elevation: 20,
          titleSpacing: 10,
        ),
        body: TabBarView(children: children),
      ),
    );
  }

  static navBar() {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UtilsWidgets.userInfo(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Friends'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Request'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }

  static BottomNavigationBar bottomBar(Function(int)? onPressed, int integer) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user),
          label: 'User',
        ),
      ],
      currentIndex: integer,
      onTap: onPressed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.amber[800],
    );
  }


  static userInfo() {
    return UserAccountsDrawerHeader(
      accountName: const Text('Rohan Thakur'),
      accountEmail: const Text('b4.rohan.com'),
      currentAccountPicture: CircleAvatar(
        child: CircleAvatar(
          child: Image.network(
            'https://avatars.githubusercontent.com/u/31396751?v=4',
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://image.shutterstock.com/image-photo/old-brick-black-color-wall-260nw-1605128917.jpg')),
      ),
    );
  }

  static launchMailto() async {
    final mailtoLink = Mailto(
      to: ['to@example.com'],
      cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'mailto example subject',
      body: 'mailto example body',
    );
    await launch('$mailtoLink');
  }

  static buildInputDeoration(String label, String hint, Widget icon) {
    return InputDecoration(
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.red)),
        icon: icon,
        labelText: label,
        hintText: hint);
  }

  static Widget socialBtn() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: const Color(0XFFFBEFD9),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    launch("https://facebook.com");
                  },
                  icon: Image.asset(
                    'assets/social/facebook.png',
                    height: 25,
                    width: 25,
                  ),
                  label: const Text('')),
              TextButton.icon(
                  onPressed: () {
                    launch("https://instagram.com");
                  },
                  icon: Image.asset(
                    'assets/social/instagram.png',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text('')),
              TextButton.icon(
                  onPressed: () {
                    launch("https://twitter.com");
                  },
                  icon: Image.asset(
                    'assets/social/twitter.png',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text(''))
            ],
          ),
        )
      ],
    );
  }

  static void zoomDialog(BuildContext context, image) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: PhotoView(
              tightMode: true,
              imageProvider: FileImage(image),
              heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
            ),
          );
        },
      );

  static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  static showDialogFunc(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Failed to Pick Image "),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

    // static void zoomDialog(BuildContext context, image) => showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           child: PhotoView(
  //             tightMode: true,
  //             imageProvider: FileImage(image),
  //             heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
  //           ),
  //         );
  //       },
  //     );
  
  static showCardFunc(context, image, title, desc) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              height: 310,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      image,
                      width: 200,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  static AppBar buildAppBar(
    String title, {
    Widget? icon,
    bool isrequired = false,
    String? btnName,
    Function()? onChange,
  }) {
    return AppBar(
        leading: icon,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        // automaticallyImplyLeading: false,
        title: Text(
          title,
          maxLines: 3,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          isrequired
              ? TextButton(
                  onPressed: onChange,
                  child: Text('$btnName',
                      style: TextStyle(
                        color: Colors.white,
                      )))
              : SizedBox()
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color.fromARGB(255, 17, 11, 68)),
        ));
  }

  // static Widget searchAbleDropDown(
  //     List<dynamic> _dropdownItems,
  //     String? holder,
  //     String labelText,
  //     String? SelectedItem,
  //     Widget? icon,
  //     ValueChanged? onChange,
  //     String? DropdownPopUpText,
  //     Color? color,
  //     String? searchFieldPropsLabelText,
  //     FormFieldValidator? validator,
  //     {bool showSearchBox = true,
  //     FocusNode? focusNode,
  //     bool showClearButton = true,
  //     bool autoFocus = false,
  //     Key? key}) {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
  //     child: Container(
  //       width: kIsWeb ? 600 : null,
  //       child: DropdownSearch(
  //         key: key,
  //         focusNode: focusNode,
  //         showClearButton: showClearButton,
  //         mode: Mode.BOTTOM_SHEET,
  //         items: _dropdownItems,
  //         dropdownSearchDecoration: InputDecoration(
  //           icon: icon,
  //           labelText: labelText,
  //           contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(32.0),
  //             borderSide: BorderSide(color: Colors.red, width: 2.0),
  //           ),
  //         ),
  //         validator: validator,
  //         onChanged: onChange,
  //         selectedItem: SelectedItem,
  //         showSearchBox: showSearchBox,
  //         searchFieldProps: TextFieldProps(
  //           autofocus: autoFocus,
  //           decoration: InputDecoration(
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(32.0),
  //               borderSide: BorderSide(color: Colors.red, width: 2.0),
  //             ),
  //             contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
  //             labelText: searchFieldPropsLabelText,
  //           ),
  //         ),
  //         popupTitle: Container(
  //           height: 50,
  //           decoration: BoxDecoration(
  //             color: color,
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20),
  //               topRight: Radius.circular(20),
  //             ),
  //           ),
  //           child: Center(
  //             child: Text(
  //               '$DropdownPopUpText',
  //               style: TextStyle(
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         ),
  //         popupShape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(24),
  //             topRight: Radius.circular(24),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Widget buildSqureBtn(String? btnName, Function()? onpress) {
    return Center(
      child: ElevatedButton(
        onPressed: onpress,
        child: Text('$btnName'),
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          onSurface: Colors.black,
        ),
      ),
    );
  }

  static Widget buildRoundBtn(String? btnsend, Function()? onPressed) {
    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
          child: Text("$btnsend"),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.teal),
            ),
            primary: Colors.teal,
          ),
          onPressed: onPressed),
    );
  }

  static Widget textFormField(String? labelText, String hintText,
      String? Function(String?)? validator, TextEditingController? controller,
      {bool isReadOnly = false,
      TextInputType textInputType = TextInputType.text,
      bool obscure = false,
      int maxLine = 1,
      Widget? icon,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Key? key,
      String? Function(String)? onChanged,
      List<TextInputFormatter>? inputFormatter,
      TextInputAction textInputAction = TextInputAction.next}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Container(
        child: TextFormField(
          onChanged: onChanged,
          style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              letterSpacing: 1),
          key: key,
          textInputAction: textInputAction,
          autofocus: false,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
          controller: controller,
          validator: validator,
          obscureText: obscure,
          maxLines: maxLine,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.black, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            icon: icon,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  static Widget dropDownButton(
      String? hint,
      String? label,
      String _dropDownValue,
      List<dynamic> dropDownItem,
      Function(dynamic)? onChange,
      {String? Function(String?)? validator,
      String? holder,
      Widget? widget}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Row(
        children: [
          widget ?? Text(""),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text("$label")),
                value: holder,
                focusColor: Colors.transparent,
                isExpanded: true,
                hint: Text(
                  '$hint',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                items: dropDownItem
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ))
                    .toList(),
                validator: validator,
                onChanged: onChange,
              ),
            ),
          ),
        ],
      ),
    );
  }

//   static Widget buildDatePicker(
//     String dateLabelText,
//     String hintText,
//     TextEditingController editingController,
//     Function(String)? onChanged,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
//       child: DateTimePicker(
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(32.0),
//               borderSide: BorderSide(width: 2.0),
//             ),
//             icon: Icon(Icons.calendar_today),
//             hintText: hintText,
//             labelText: dateLabelText,
//             labelStyle: TextStyle(color: Colors.grey)),
//         type: DateTimePickerType.date,
//         dateMask: 'd MMM, yyyy',
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2100),
//         icon: const Icon(Icons.event),
//         controller: editingController,
//         onChanged: onChanged,
//         validator: (val) {
//           if (val!.isEmpty) {
//             return "Please Choose Webinar Date";
//           }
//         },
//       ),
//     );
//   }

//   static ToggleButtons buildToggelButton(
//       List<bool> isSelected, Function(int)? onPressed) {
//     return ToggleButtons(
//       borderRadius: const BorderRadius.all(Radius.circular(8)),
//       selectedBorderColor:
//           isSelected[0] ? Colors.greenAccent : Colors.redAccent,
//       selectedColor: Colors.black,
//       fillColor: isSelected[0] ? Colors.green : Colors.red,
//       color: Colors.black,
//       constraints: const BoxConstraints(
//         minHeight: 40.0,
//         minWidth: 80.0,
//       ),
//       children: [Text('Yes'), Text('No')],
//       isSelected: isSelected,
//       onPressed: onPressed,
//     );
//   }

//   static showAlertDialog(BuildContext context, Function()? okPressed,
//       String? title, String? content1,
//       {String? note}) {
//     Widget okButton = TextButton(
//       child: Text('Ok'),
//       onPressed: okPressed,
//     );

//     AlertDialog alert = AlertDialog(
//       title: Text(
//         "$title",
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       content: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Text("$content1"),
//             Text(
//               "$note",
//               style: TextStyle(
//                   fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         okButton,
//       ],
//     );
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   static addField(BuildContext context, Function()? okPressed, String? title,
//       GlobalKey key, TextEditingController answer,
//       {TextEditingController? options, bool isRequired = true}) {
//     Widget okButton = TextButton(
//       child: Text('Ok'),
//       onPressed: okPressed,
//     );

//     AlertDialog alert = AlertDialog(
//       title: Text(
//         "$title",
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       content: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Form(
//           key: key,
//           child: Column(
//             children: [
//               UtilsWidgets.textFormField('answer', 'answer', (p0) {
//                 if (p0 == null || p0.isEmpty) {
//                   return "Please Enter correct answer";
//                 }
//               }, answer),
//               isRequired
//                   ? UtilsWidgets.textFormField('options', 'options', (p0) {
//                       if (p0 == null || p0.isEmpty) {
//                         return "Please Enter options";
//                       }
//                     }, options, maxLine: 4)
//                   : SizedBox()
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         okButton,
//       ],
//     );
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

  static showToastFunc(message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        fontSize: 16.0);
  }

//   static bottomDialogs(
//       String msg,
//       String title,
//       String btn1name,
//       String btn2name,
//       BuildContext context,
//       Function() on1Pressed,
//       Function() on2Pressed) {
//     return Dialogs.bottomMaterialDialog(
//         msg: msg,
//         title: title,
//         context: context,
//         actions: [
//           IconsOutlineButton(
//             onPressed: on1Pressed,
//             text: btn1name,
//             iconData: Icons.cancel_outlined,
//             textStyle: TextStyle(color: Colors.grey),
//             iconColor: Colors.red,
//           ),
//           IconsButton(
//             onPressed: on2Pressed,
//             text: btn2name,
//             iconData: Icons.swipe_right,
//             color: Colors.green,
//             textStyle: TextStyle(color: Colors.white),
//             iconColor: Colors.white,
//           ),
//         ]);
//   }

//   static showRatingAppDialog(BuildContext context, String title,
//       Function() onCancelled, Function(dynamic) onSubmitted) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (context) {
//         return Center(
//           child: RatingDialog(
//             title: Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             message: Text(
//               'feed_q1'.tr,
//               textAlign: TextAlign.center,
//             ),
//             image: Image.asset(
//               "assets/images/app_icon.png",
//               height: 100,
//             ),
//             commentHint: 'feed_q2'.tr,
//             submitButtonText: 'submit'.tr,
//             onCancelled: onCancelled,
//             onSubmitted: onSubmitted,
//           ),
//         );
//       },
//     );
//   }
}

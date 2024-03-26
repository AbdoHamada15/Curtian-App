import 'package:flutter/material.dart';
import 'package:curtian_app/page_admin/menu.dart';
import 'package:random_string/random_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curtian_app/page_admin/pages/note/database.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  bool today = true, tomorrow = false, nextweek = false;
  bool suggest = false;
  Stream? todoStream;
  getontheload() async {
    todoStream = await DatabaseMethods().getalltheWork(today
        ? "Today"
        : tomorrow
            ? "Tomorrow"
            : "NextWeek");
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allWork() {
    return StreamBuilder(
        stream: todoStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return CheckboxListTile(
                      activeColor: const Color(0xFF279cfb),
                      title: Text(
                        ds["Work"],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400),
                      ),
                      value: ds["Yes"],
                      onChanged: (newValue) async {
                        await DatabaseMethods().updateifTicked(
                            ds["Id"],
                            today
                                ? "Today"
                                : tomorrow
                                    ? "Tomorrow"
                                    : "NextWeek");
                        setState(() {});
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  })
              : const CircularProgressIndicator();
        });
  }

  TextEditingController todocontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MenuWidget(),
        backgroundColor: Colors.tealAccent,
        title: const Text(
          'Add Note',
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBox();
        },
        child: const Icon(
          Icons.add,
          color: Color(0xFF249fff),
          size: 30.0,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff232fda2),
          Color(0xFF13D8CA),
          Color(0xFF01abfd)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Abdo Hamada",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Good morning",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                today
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3dffe3),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Today",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          today = true;
                          tomorrow = false;
                          nextweek = false;
                          await getontheload();
                          setState(() {});
                        },
                        child: const Text(
                          "Today",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                tomorrow
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3dffe3),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Tomorrow",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          today = false;
                          tomorrow = true;
                          nextweek = false;
                          await getontheload();
                          setState(() {});
                        },
                        child: const Text(
                          "Tomorrow",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                nextweek
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3dffe3),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Next Week",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          today = false;
                          tomorrow = false;
                          nextweek = true;
                          await getontheload();
                          setState(() {});
                        },
                        child: const Text(
                          "Next Week",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            allWork(),
          ],
        ),
      ),
    );
  }

  Future openBox() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.cancel)),
                      const SizedBox(
                        width: 30.0,
                      ),
                      const Text(
                        "Add the Work ToDo",
                        style: TextStyle(
                            color: Color(0xff008080),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("Add Text"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: todocontroller,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Enter Text"),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> userTodo = {
                        "Work": todocontroller.text,
                        "Id": id,
                        "Yes": false,
                      };
                      today
                          ? DatabaseMethods().addTodayWork(userTodo, id)
                          : tomorrow
                              ? DatabaseMethods().addTomorrowWork(userTodo, id)
                              : DatabaseMethods().addNextWeekWork(userTodo, id);
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF008080),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}

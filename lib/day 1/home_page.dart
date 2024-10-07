import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Material & Cupertino',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: Colors.black,
          elevation: 4,
        ),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  helperText: 'MM/DD/YYYY',
                  helperStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff8DC26F), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: (selectDate == null)
                      ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                      : '${selectDate!.day}/${selectDate!.month}/${selectDate!.year}',
                  suffixIcon: InkWell(
                    onTap: () async {
                      selectDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Color(0xff8DC26F),
                                onSurface: Colors.black,
                                primaryContainer: Colors.green,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {});
                    },
                    child: Icon(Icons.calendar_today, color: Colors.black54),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8DC26F),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),

            SizedBox(
              height: 250,
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {},
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(

                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone ringtone",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        height: 170,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioMenuButton(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {},
                                  child: Text("None")),
                              RadioMenuButton(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {},
                                child: Text("Callisto"),
                              ),
                              RadioMenuButton(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {},
                                  child: Text("Ganymede")),
                              RadioMenuButton(
                                  value: true,
                                  groupValue: false,
                                  onChanged: (value) {},
                                  child: Text("Luna")),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                // Get.back();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Color(0xffAC3817)),
                              )),
                          TextButton(
                              onPressed: () {
                               Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(color: Color(0xffAC3817)),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }, child: Text("Dialog Box")),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGradientFloatingActionButton(
              icon: Icons.lock_clock,
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 250,
                      padding: EdgeInsets.all(16),
                      child: CupertinoTimerPicker(
                        onTimerDurationChanged: (value) {},
                      ),
                    );
                  },
                );
              },
              gradientColors: [Color(0xff8DC26F), Color(0xff386927)],
            ),
            _buildGradientFloatingActionButton(
              icon: Icons.backup,
              onPressed: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('Favorite Dessert', style: TextStyle(fontWeight: FontWeight.bold)),
                    message: const Text('Please select the best dessert from the options below.'),
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Profiteroles'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cannolis'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Trifle'),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
              },
              gradientColors: [Color(0xfff7b733), Color(0xfffc4a1a)],
            ),
            _buildGradientFloatingActionButton(
              icon: Icons.access_time,
              onPressed: () async {
                selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        timePickerTheme: TimePickerThemeData(
                          dialHandColor: Color(0xff8DC26F),
                          hourMinuteTextColor: Colors.black,
                          hourMinuteShape: CircleBorder(),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                setState(() {});
              },
              gradientColors: [Color(0xff2193b0), Color(0xff6dd5ed)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientFloatingActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    required List<Color> gradientColors,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        elevation: 8,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(3, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(15),
          child: Icon(icon, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

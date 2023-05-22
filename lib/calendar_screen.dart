import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Map<String, List> mySelectedEvents = {};
  //
  // final titleController = TextEditingController();
  // final descController = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _selectedDay = _focusedDay;
  //   loadPreviousEvents();
  // }
  //
  // loadPreviousEvents() {
  //   mySelectedEvents = {
  //     "2023-05-13": [
  //       {"eventDesc": "11", "eventTitle": "111"},
  //       {"eventDesc": "22", "eventTitle": "22"}
  //     ],
  //     "2023-05-03": [
  //       {"eventDesc": "22", "eventTitle": "22"}
  //     ],
  //     "2023-05-20": [
  //       {"eventTitle": "ss", "eventDesc": "ss"}
  //     ]
  //   };
  // }
  //
  // List _listOfDayEvents(DateTime dateTime) {
  //   if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
  //     return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
  //   } else {
  //     return [];
  //   }
  // }
  // _showAddEventDialog() async {
  //   await showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: const Text(
  //               'Add new event',
  //               textAlign: TextAlign.center,
  //             ),
  //             content: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextField(
  //                   controller: titleController,
  //                   textCapitalization: TextCapitalization.words,
  //                   decoration: const InputDecoration(labelText: 'Title'),
  //                 ),
  //                 TextField(
  //                   maxLines: 3,
  //                   controller: descController,
  //                   textCapitalization: TextCapitalization.words,
  //                   decoration: const InputDecoration(labelText: 'Desc'),
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('cancel')),
  //                TextButton(
  //                   onPressed: () {
  //                     if (titleController.text.isEmpty &&
  //                         descController.text.isEmpty) {
  //                       ScaffoldMessenger.of(context)
  //                           .showSnackBar(const SnackBar(
  //                             content: Text('Required'),
  //                             duration: Duration(seconds: 2),
  //                       ));
  //                       return;
  //                     } else {
  //                       print(titleController.text);
  //                       print(descController.text);
  //                       setState(() {
  //                         if (mySelectedEvents[
  //                         DateFormat('yyyy-MM-dd').format(_selectedDay!)] !=
  //                             null) {
  //                           mySelectedEvents[
  //                           DateFormat('yyyy-MM-dd').format(_selectedDay!)]
  //                               ?.add({
  //                             "eventTitle": titleController.text,
  //                             "eventDesc": descController.text,
  //                           });
  //                         } else {
  //                           mySelectedEvents[
  //                           DateFormat('yyyy-MM-dd').format(_selectedDay!)] = [
  //                             {
  //                               "eventTitle": titleController.text,
  //                               "eventDesc": descController.text,
  //                             }
  //                           ];
  //                         }
  //                       });
  //                       print(
  //                           "New Event for backend developer ${json.encode(mySelectedEvents)}");
  //                       titleController.clear();
  //                       descController.clear();
  //                       Navigator.pop(context);
  //                       return;
  //                     }
  //                   },
  //                   child: const Text('Add Event')),
  //
  //             ],
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calendar Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime(2022),
              lastDay: DateTime(2025),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              rowHeight: 60,
              daysOfWeekHeight: 60,
              headerStyle: HeaderStyle(
                titleTextStyle: const TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.bold),
                formatButtonTextStyle: const TextStyle(color: Colors.green),
                formatButtonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                leftChevronIcon: const Icon(
                  Icons.arrow_back,
                  color: Colors.teal,
                  size: 28,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.teal,
                  size: 28,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.red),
              ),
              calendarStyle: const CalendarStyle(
                weekendTextStyle: TextStyle(color: Colors.red),
                todayDecoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            // ..._listOfDayEvents(_selectedDay!).map(
            //       (myEvents) => ListTile(
            //     leading: const Icon(
            //       Icons.done,
            //       color: Colors.teal,
            //     ),
            //     title: Padding(
            //       padding: const EdgeInsets.only(bottom: 8.0),
            //       child: Text('Event Title:   ${myEvents['eventTitle']}'),
            //     ),
            //     subtitle: Text('Description:   ${myEvents['eventDesc']}'),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add Event'),
      ),
    );
  }
}

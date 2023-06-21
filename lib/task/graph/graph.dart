import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentBuilder extends StatelessWidget{
  const AppointmentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SfCalendar(
         //initialSelectedDate:  DateTime(2023,6,DateTime.now().day,1,0,0),
         initialDisplayDate:  DateTime(2023,6,DateTime.now().day,DateTime.now().hour,0,0),
          firstDayOfWeek: 1,
          view: CalendarView.day,
          allowedViews: const <CalendarView>[
            CalendarView.day,
            CalendarView.workWeek,
            CalendarView.week,
            CalendarView.month,
            CalendarView.timelineDay,
            CalendarView.timelineWeek,
            CalendarView.timelineWorkWeek,
            CalendarView.timelineMonth,
            CalendarView.schedule
          ],
          dataSource: _getCalendarDataSource(),
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          timeSlotViewSettings: const TimeSlotViewSettings(timelineAppointmentHeight: 100,timeIntervalHeight: 50),
          appointmentBuilder: appointmentBuilder,
        ));
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> meetings = <Appointment>[];
    int x=DateTime.now().hour-2;
    meetings.add(
      Appointment(
        startTime: DateTime(2023,6,DateTime.now().day,x,0,0),
        endTime: DateTime(2023,6,DateTime.now().day,x,0,0).add(const Duration(minutes: 80)),
        subject: 'Nellie Lawrence',
        color: Colors.white,
      ),
    );
    final DateTime startTime = DateTime(2023,6,DateTime.now().day,DateTime.now().hour,0,0);
    final DateTime endTime = startTime.add(const Duration(minutes: 80));
    meetings.add(
      Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'Francisco Elliot',
        color: Colors.white,
      ),
    );
    final DateTime endTime1 = endTime.add(const Duration(minutes: 80));
    meetings.add(
      Appointment(
        startTime: endTime.add( const Duration(minutes:20 )),
        endTime: endTime1.add( const Duration(minutes:20 )),
        subject: 'Issac Alexander ',
        color: Colors.white,
      ),
    );
    final DateTime endTime2 = endTime1.add(const Duration(minutes: 70));
    meetings.add(
      Appointment(
        startTime: endTime1.add( const Duration(minutes:40 )),
        endTime: endTime2.add( const Duration(minutes:40 )),
        subject: 'Vera Hopkins ',
        color: Colors.white,
      ),
    );
    return _AppointmentDataSource(meetings);
  }

  Widget appointmentBuilder(BuildContext context,
      CalendarAppointmentDetails calendarAppointmentDetails) {
    final Appointment appointment = calendarAppointmentDetails.appointments.first;
     if(appointment.startTime.hour-DateTime.now().hour>=0){
       return   appointmentResult(
         context: context,
         calendarAppointmentDetails: calendarAppointmentDetails,
         decorationColor: appointment.color,
         avatarColor:  Colors.grey.shade300,
         iconColor:  Colors.blueAccent,
       );
     }
     return appointmentResult(
       context: context,
       calendarAppointmentDetails: calendarAppointmentDetails,
       decorationColor:  Colors.white.withOpacity(0.3),
       avatarColor:  Colors.grey.withOpacity(0.6),
       iconColor:  Colors.grey,
     );
  }

  Widget appointmentResult({
    required BuildContext context,
    required CalendarAppointmentDetails calendarAppointmentDetails,
    required Color decorationColor,
    required Color avatarColor,
    required Color iconColor,

  }){
    final Appointment appointment = calendarAppointmentDetails.appointments.first;
    return  Container(
      margin: const EdgeInsetsDirectional.only(start: 30,end: 50),
      width: calendarAppointmentDetails.bounds.width*0.5,
      height: calendarAppointmentDetails.bounds.height / 2,
      decoration:  BoxDecoration(
          color: decorationColor,
          borderRadius:
          const BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor:avatarColor,
              radius: 13,
              child:   Icon(
                Icons.access_time_filled,
                color: iconColor,
                size: 18,
              ),
            ),
            const SizedBox(width: 5,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(//
                  appointment.subject,
                  textAlign: TextAlign.center,style: const TextStyle(fontSize: 10),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  [
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      '${DateFormat(' hh:mm a').format(appointment.startTime)} - ${DateFormat('hh:mm a').format(appointment.endTime)}',
                      textAlign: TextAlign.center,style: const TextStyle(fontSize: 8,color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
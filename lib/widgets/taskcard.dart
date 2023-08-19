import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/core/taskmodel.dart';

class TaskCard extends StatelessWidget {
  TaskCard({super.key,required this.task});
  TaskModel task;
  @override
  Widget build(BuildContext context) {
    double percentage=(task.completedtask / task.totaltasks)*100;
    String firstFour = String.fromCharCodes(percentage.toString().runes.take(5));
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(task.name,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ) 
                    ,),
                    const Icon(
                      Icons.task
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded,color: Colors.grey,size: 15,),
                        const SizedBox(width: 10,),
                        Text(task.startdate,
                        style: GoogleFonts.inter(color: Colors.grey,),),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: 70,
                      child: Image.asset("assets/arrowicon.png",fit: BoxFit.contain,)),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded,color: Colors.purple,size: 15,),
                        const SizedBox(width: 10,),
                        Text(task.startdate,
                        style: GoogleFonts.inter(color: Colors.purple,),),
                      ],
                    ),                                          
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                    Text("$firstFour %",
                     style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ) ),
                    const SizedBox(width: 5,),
                     ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        child: SizedBox(
                          width: 164,
                          child: LinearProgressIndicator(
                            minHeight: 7,
                              backgroundColor: const Color.fromARGB(255, 234, 233, 233),
                              color: const Color(0xFF3E40F9),
                              value: task.completedtask / task.totaltasks,
                              semanticsLabel: 'Linear progress indicator',
                              ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Row(
                        children: [
                          Text(task.completedtask.toString(),
                       style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    )),
                          Text("/",
                       style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    )),
                          Text(task.totaltasks.toString(),
                       style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    )),
                          Text(" tasks",
                       style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    )),

                        ],
                      )
                   ],
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
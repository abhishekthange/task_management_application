import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/widgets/taskcard.dart';

import '../core/taskmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});
  static const routeName = '/HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<TaskModel>projects=[];
  List<TaskModel>completed=[];
  @override
  void initState() {
    super.initState();
    for (TaskModel i in tasks) {
      if (i.totaltasks>i.completedtask) {
        projects.add(i);
      }
      else{
        completed.add(i);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    const SizedBox(height: 15,),
                    Text("Project",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        TaskModel data=TaskModel(name: 'New Task', startdate: '2023-11-10', enddate: '2023-11-12', completedtask: 34, totaltasks: 50);
                           if (data.totaltasks>data.completedtask) {
                            projects.add(data);
                          }
                          else{
                            completed.add(data);
                          }
                        
                        setState(() {
                          tasks.add(data);
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                        child: Icon(Icons.add,color: Colors.white,size: 20,),
                        ),
                      ),
                    )
                  ],
                ),
                 const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_rounded,color: Colors.grey,),
                          const SizedBox(width: 15,),
                          Text("Search",style: GoogleFonts.inter(color: Colors.grey),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              DefaultTabController(
              length: 3,
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.90,
                child: Column(
                  children: <Widget>[
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:12.0),
                        child: Container(
                          constraints: const BoxConstraints.expand(height: 45),
                          child: TabBar(
                              onTap: (value) => {},
                               indicator: BoxDecoration(
                            color:Colors.purple,
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                          border: Border.all(color: const Color.fromARGB(255, 50, 86, 232))
                            ),
                              unselectedLabelColor: const Color(0xFFCBCBFE),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              labelStyle: GoogleFonts.inter(
                                      fontSize:16,
                                      fontWeight: FontWeight.w600
                                    ),
                              tabs: [
                                const Tab(
                                  child: Text(
                                    "Projects",
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Completed",
                                    style:GoogleFonts.inter(
                                      fontSize:16,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Flag",
                                    style: GoogleFonts.inter(
                                      fontSize:16,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:48.0),
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: projects.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TaskCard(task: projects[index]);
                              }),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: completed.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TaskCard(task: completed[index]);
                              }),
                            Container()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
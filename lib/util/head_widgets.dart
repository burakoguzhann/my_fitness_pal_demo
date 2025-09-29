import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/stats_model.dart';

import 'package:flutter_fitness_app/providers/stats_provider.dart';
import 'package:flutter_fitness_app/util/body_widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Head extends StatefulWidget {
  const Head({super.key});

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  void handleStats() {
    final _provider = Provider.of<StatsProvider>(context, listen: false);
    final statsData = StatsModel(
      height: int.tryParse(_heightController.text) ?? 0,
      weight: int.tryParse(_weightController.text) ?? 0,
      age: int.tryParse(_ageController.text) ?? 0,
    );
    _provider.bilgileriTut(statsData);
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<StatsProvider>(context).userData;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Text(
                      'Push',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 65.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Your',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 55.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Limits',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 60.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h, right: 10.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    color: Colors.black.withOpacity(0.3),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Container(
                      width: 187.w,
                      height: 185.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(13.w),
                                  child: Text(
                                    'User Stats',
                                    style: GoogleFonts.aladin(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Container(
                                  width: 32.w,
                                  height: 32.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(45.r),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      newMethod(context);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Height:  ${_provider?.height} CM',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Weight:  ${_provider?.weight} KG',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Age:  ${_provider?.age} Y'O",
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(thickness: 2.h),
        Expanded(child: BodyColumn()),
      ],
    );
  }

  Future<dynamic> newMethod(BuildContext context) {
    return showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 300.h,
                                          decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24.r),
                                              topRight: Radius.circular(24.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20.h,
                                                  ),
                                                  child: SizedBox(
                                                    width: 220.w,
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: Colors
                                                            .white, 
                                                        fontSize: 16.sp,
                                                      ),
                                                      controller:
                                                          _heightController,
                                                      decoration: InputDecoration(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    45.r,
                                                                  ),
                                                              borderSide:
                                                                  BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                        suffixIcon: Icon(
                                                          Icons.height,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                0.5,
                                                              ),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors
                                                            .white
                                                            .withOpacity(0.1),
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                45.r,
                                                              ),
                                                        ),
                                                        labelText:
                                                            'Height(CM)',
                                                        labelStyle:
                                                            GoogleFonts.aboreto(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 14.sp,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 15.h),
                                                SizedBox(
                                                  width: 220.w,
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.sp,
                                                    ),
                                                    controller:
                                                        _weightController,
                                                    decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  45.r,
                                                                ),
                                                            borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                          ),
                                                      suffixIcon: Icon(
                                                        Icons.scale_outlined,
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white
                                                          .withOpacity(0.1),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              45.r,
                                                            ),
                                                      ),
                                                      labelText: 'Weight(KG)',
                                                      labelStyle:
                                                          GoogleFonts.aboreto(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 14.sp,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 15.h),
                                                SizedBox(
                                                  width: 220.w,
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.sp,
                                                    ),
                                                    controller:
                                                        _ageController,
                                                    decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  45.r,
                                                                ),
                                                            borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                          ),
                                                      suffixIcon: Icon(
                                                        Icons.assignment_ind,
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white
                                                          .withOpacity(0.1),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              45.r,
                                                            ),
                                                      ),
                                                      labelText: 'Age',
                                                      labelStyle:
                                                          GoogleFonts.aboreto(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 14.sp,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),

                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                          Colors.white
                                                              .withOpacity(
                                                                0.1,
                                                              ),
                                                        ),
                                                  ),
                                                  onPressed: () {
                                                    handleStats();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'To Stats Add',
                                                    style:
                                                        GoogleFonts.aBeeZee(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
  }
}

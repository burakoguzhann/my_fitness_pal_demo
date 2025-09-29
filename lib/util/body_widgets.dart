import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/providers/calculate_provider.dart';
import 'package:flutter_fitness_app/providers/pedometer_provider.dart';
import 'package:flutter_fitness_app/util/caloricalculator_widgets.dart';
import 'package:flutter_fitness_app/util/exercise_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class BodyColumn extends StatefulWidget {
  const BodyColumn({super.key});

  @override
  State<BodyColumn> createState() => _BodyColumnState();
}

class _BodyColumnState extends State<BodyColumn> {
  @override
  Widget build(BuildContext context) {
    final _pedometerProvider = Provider.of<StepCounterProvider>(context);
    final _provider = Provider.of<CalculateProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150.h,
                    width: 150.w,
                    child: Card(
                      elevation: 2,
                      color: Colors.black.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 7.h),
                            child: Text(
                              'Calori Calculator',
                              style: GoogleFonts.aladin(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 15.h),
                            child: Text(
                              '${_provider.toplam.toInt()} / per day',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 25.sp,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(top: 25.h),
                            child: ShowModalBottomSheet(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    height: 150.h,
                    width: 150.w,
                    child: Card(
                      elevation: 2,
                      color: Colors.black.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: Text(
                              'Steps Calculator',
                              style: GoogleFonts.aladin(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Text(
                              '${_pedometerProvider.steps}',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 25.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, left: 10.w),
                            child: Text(
                              "(If you start walking while the app is open, it will be calculated automatically.)",
                              style: GoogleFonts.zillaSlab(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          exercise_card(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/exercise_model.dart';
import 'package:flutter_fitness_app/providers/exercisecard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class exercise_card extends StatefulWidget {
  const exercise_card({super.key});

  @override
  State<exercise_card> createState() => _exercise_cardState();
}

class _exercise_cardState extends State<exercise_card> {
  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _setCountController = TextEditingController();
  void handleExercise() {
    final _provider = Provider.of<ExercisecardProvider>(context, listen: false);
    ExerciseModel model = ExerciseModel(
      exerciseName: _exerciseNameController.text,
      setCount: int.tryParse(_setCountController.text) ?? 0,
    );
    _provider.addExercise(model);
  }

  @override
  Widget build(BuildContext context) {
    final _providerList = Provider.of<ExercisecardProvider>(
      context,
      listen: true,
    ).exercise;
    return SizedBox(
      
      width: 345.w,
      child: Card(
        elevation: 2,
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 5.h),
                  child: Text(
                    'Exercise Routine',
                    style: GoogleFonts.aladin(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 115.w, top: 5.h),
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        newMethod(context);
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.all(15.h),
              shrinkWrap: true,
              itemCount: _providerList.length,
              itemBuilder: (context, index) {
                final _item = _providerList[index];
                return Card(
                  color: Colors.white.withOpacity(0.2),
                  child: ListTile(
                    
                    title: Text('Exercise Name: ${_item.exerciseName}', style: GoogleFonts.beVietnamPro(color: Colors.white, fontSize: 15.sp),),
                    subtitle: Text('Set Count: ${_item.setCount.toString()}' , style: GoogleFonts.beVietnamPro(color: Colors.white),),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> newMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250.h,
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
                  padding: EdgeInsets.only(top: 20.h),
                  child: SizedBox(
                    width: 220.w,
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      controller: _exerciseNameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45.r),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: Icon(
                          Icons.sports_gymnastics,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45.r),
                        ),
                        labelText: 'Exercise Name',
                        labelStyle: GoogleFonts.aboreto(
                          color: Colors.white,
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
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    controller: _setCountController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.r),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(
                        Icons.countertops_outlined,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.r),
                      ),
                      labelText: 'Set Count',
                      labelStyle: GoogleFonts.aboreto(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white.withOpacity(0.1),
                    ),
                  ),
                  onPressed: () {
                    handleExercise();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'To Exercise Add',
                    style: GoogleFonts.aBeeZee(
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

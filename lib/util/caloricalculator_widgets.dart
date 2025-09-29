import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/caloricalculator_model.dart';
import 'package:flutter_fitness_app/providers/calculate_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({super.key});

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  void handleCalculate() async {
    final _provider = Provider.of<CalculateProvider>(context, listen: false);
    final _user = CaloriCalculatorModel(
      height: int.tryParse(_heightController.text) ?? 0,
      weight: int.tryParse(_weightController.text) ?? 0,
      age: int.tryParse(_ageController.text) ?? 0,
      male: _provider.isMale,
    );
    await _provider.toCalculate(_user);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.white.withOpacity(0.1),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 350.h,

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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                          controller: _heightController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.r),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            suffixIcon: Icon(
                              Icons.height,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.r),
                            ),
                            labelText: 'Height(CM)',
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
                        controller: _weightController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: Icon(
                            Icons.scale_outlined,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                          ),
                          labelText: 'Weight(KG)',
                          labelStyle: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 220.w,
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        controller: _ageController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: Icon(
                            Icons.assignment_ind,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                          ),
                          labelText: 'Age',
                          labelStyle: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Female',
                          style: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontSize: 17.sp,
                          ),
                        ),
                        SizedBox(width: 15.sp),
                        Switch(
                          value: Provider.of<CalculateProvider>(context).isMale,
                          onChanged: (value) {
                            Provider.of<CalculateProvider>(
                              context,
                              listen: false,
                            ).setGender(value);
                          },
                        ),
                        SizedBox(width: 15.sp),
                        Text(
                          'Male',
                          style: GoogleFonts.aboreto(
                            color: Colors.white,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.1),
                        ),
                      ),
                      onPressed: () {
                        handleCalculate();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Calculate',
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
      },
      child: Text(
        'Calculate',
        style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 15.sp),
      ),
    );
  }
}

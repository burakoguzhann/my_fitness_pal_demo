import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/providers/foods_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CaloriesScreen extends StatefulWidget {
  const CaloriesScreen({super.key});

  @override
  State<CaloriesScreen> createState() => _CaloriesScreenState();
}

class _CaloriesScreenState extends State<CaloriesScreen> {
  @override
  void initState() {
    super.initState();
    // Provider'daki getAllFoods fonksiyonunu çağır
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FoodsProvider>(context, listen: false).getAllFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<FoodsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              onChanged: (value) => _provider.getSearchFoods(value),
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _provider.FoodsModelList.length,
                itemBuilder: (context, index) {
                  final item = _provider.FoodsModelList[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.calories.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

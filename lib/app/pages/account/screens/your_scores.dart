import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/app/controllers/recent_results/controller.dart';
import 'package:quiz_app/app/models/page_status.dart';
import 'package:quiz_app/app/pages/account/widgets/custom_container.dart';

class YourScores extends GetView<RecentResultController> {
  const YourScores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.r,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Your Scores'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 20.h,
        ),
        child: Obx(() {
          final pageState = controller.pageState.value;
          if (pageState == PageState.initial ||
              pageState == PageState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (pageState == PageState.success) {
            final _res = controller.recentResult.value;
            if (_res.isEmpty) {
              return const Center(
                child: Text('No Recent result'),
              );
            }
            return ListView.builder(
              itemCount: _res.length,
              itemBuilder: (context, index) {
                final _score = _res[index];
                final _date = DateTime.parse(_score.date!);
                final _dateString = DateFormat('EE dd, yyyy').format(_date);
                final _time = DateFormat.jm('en_US').format(_date);
                return CustomContainer(
                  marginBottom: 20.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _score.category!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.h,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Score: ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                _score.score!,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$_dateString $_time',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Score: ',
                                style: TextStyle(
                                  color: const Color(0xff141A33),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                '${_score.total}',
                                style: TextStyle(
                                  color: const Color(0xff32095c),
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('Something went wrong');
          }
        }),
      ),
    );
  }
}

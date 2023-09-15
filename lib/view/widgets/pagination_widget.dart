import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:xpay_task/controller/user_provider.dart';

Widget paginatonWidget(BuildContext context) {
  final provider = Provider.of<UserProvider>(context, listen: false);
  return Positioned(
    bottom: 5.h,
    left: 0,
    right: 0,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.currentPage >= 1)
              ElevatedButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .loadPreviousPage(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 186, 167, 231)),
                  ),
                ),
                child: const Text('Previous'),
              ),
            SizedBox(width: 5.w),
            for (int page = 1; page < 10; page++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false)
                        .loadPage(context, page);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        page == provider.currentPage ? Colors.deepPurple : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 186, 167, 231)),
                    ),
                  ),
                  child: Text('$page'),
                ),
              ),
            SizedBox(width: 5.w),
            provider.currentPage == 9
                ? const SizedBox()
                : ElevatedButton(
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .loadNextPage(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 186, 167, 231)),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
          ],
        ),
      ),
    ),
  );
}

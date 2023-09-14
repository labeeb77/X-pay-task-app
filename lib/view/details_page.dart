import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpay_task/model/user_details.dart';

class DetailsPage extends StatelessWidget {
  final UserDetailsModel userDetailsModel;
  const DetailsPage({super.key, required this.userDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(userDetailsModel.image),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '${userDetailsModel.firstName} ${userDetailsModel.lastName}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone_android_rounded,
                      size: 20,
                    ),
                    Text(" ${userDetailsModel.phone}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                    Text(" ${userDetailsModel.email}"),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Other Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListTile(
                          title: const Text(
                            'Age',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(userDetailsModel.age.toString()),
                        ),
                        const ListTile(
                          title: Text(
                            'Gender',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text('Male'),
                        ),
                        ListTile(
                          title: const Text(
                            'Date of Birth',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(userDetailsModel.birthDate),
                        ),
                        ListTile(
                          title: const Text(
                            'City',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(userDetailsModel.city),
                        ),
                        ListTile(
                          title: const Text(
                            'Address',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(userDetailsModel.address),
                        ),
                        ListTile(
                          title: const Text(
                            'Blood Group',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(userDetailsModel.bloodGroup),
                        ),
                        ListTile(
                          title: const Text(
                            'Height',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text('${userDetailsModel.height} cm'),
                        ),
                        ListTile(
                          title: const Text(
                            'Weight',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text('${userDetailsModel.weight} kg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

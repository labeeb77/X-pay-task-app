import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xpay_task/controller/api_service.dart';
import 'package:xpay_task/view/details_page.dart';
import 'package:xpay_task/view/widgets/pagination_widget.dart';
import '../model/user_details.dart';
import '../model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              FutureBuilder<List<User>>(
                future: fetchResults(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available.'));
                  } else {
                    List<User> users = snapshot.data!;

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        User user = users[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () async {
                                UserDetailsModel? userDetails =
                                    await fetchUserDetails(user.id);

                                if (userDetails != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          userDetailsModel: userDetails),
                                    ),
                                  );
                                } else {
                                  log('Error occurred while getting user data');
                                }
                              },
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(user.image),
                              ),
                              title: Text(
                                "${user.firstName} ${user.lastName}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user.phone,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[500])),
                                  Text(user.email,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[500])),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              paginatonWidget(context)
            ],
          ),
        ),
      ),
    );
  }
}

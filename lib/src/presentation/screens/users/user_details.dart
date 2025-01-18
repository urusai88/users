import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../domain.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: ref
            .watch(userProvider(id))
            .whenOrNull(data: (user) => Text('User #$id')),
      ),
      body: ref.watch(userProvider(id)).when(
            data: (user) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Name: ${user.name}'),
                      Text('Email: ${user.email}'),
                      Text('Phone: ${user.phone}'),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                          await launchUrlString('https://${user.website}/');
                        },
                        child: Row(
                          children: [
                            Text('Website: '),
                            Text(
                              user.website,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Address: ${user.address.street}, ${user.address.suite}, ${user.address.city}',
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => RefreshIndicator(
              onRefresh: () async => ref.refresh(userProvider(id).future),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Center(
                      child: Text('Error: $error'),
                    ),
                  )
                ],
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class MyError extends StatelessWidget {
  const MyError({
    super.key,
    required this.error,
  });

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    String message = switch (error) {
      final DioException dioException => 'Internet connection error',
      _ => '$error',
    };

    return Center(
      child: Text('Error: $error'),
    );
  }
}

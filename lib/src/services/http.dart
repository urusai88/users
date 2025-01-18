import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tio/tio.dart';

import '../data.dart';

part 'http.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) =>
    Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

@Riverpod(keepAlive: true)
Tio<String> tio(Ref ref) => Tio(
      dio: ref.read(dioProvider),
      factoryConfig: TioFactoryConfig(
        jsonFactories: {
          User.fromJson,
        },
        errorStringFactory: (string) => string,
        errorJsonFactory: (json) => 'Unknown error',
      ),
    );

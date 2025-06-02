import 'package:flutter_assessment/main/app_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assessment/core/network/dio_client.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(baseUrl: EnvInfo.connectionString);
});

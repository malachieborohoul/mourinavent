import 'package:get_it/get_it.dart';
import 'package:mourinavent/core/secrets/app_secrets.dart';
import 'package:mourinavent/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mourinavent/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';
import 'package:mourinavent/features/auth/domain/usecases/user_sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';
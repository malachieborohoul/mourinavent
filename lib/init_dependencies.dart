import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/secrets/app_secrets.dart';
import 'package:rinavent/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rinavent/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';
import 'package:rinavent/features/auth/domain/usecases/current_user.dart';
import 'package:rinavent/features/auth/domain/usecases/sign_up_with_apple.dart';
import 'package:rinavent/features/auth/domain/usecases/sign_up_with_google.dart';
import 'package:rinavent/features/auth/domain/usecases/user_sign_in.dart';
import 'package:rinavent/features/auth/domain/usecases/user_sign_up.dart';
import 'package:rinavent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';
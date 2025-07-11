import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rinavent/core/error/exceptions.dart';

Future<T> errorHandler<T>(Future<T> Function() callback) async {
    try {
      return await callback();
    } on TimeoutException catch (e) {
      debugPrint("💡From errorHandler - TimeoutException $e  ");

      throw ServerException(e.message ?? 'Timeout Error');
    } on FormatException catch (e) {
      debugPrint("💡From errorHandler - FormatException $e  ");

      throw ServerException(e.message);
    } on SocketException catch (e) {
      debugPrint("💡From errorHandler - SocketException $e  ");

      throw ServerException(e.message);
    } on PlatformException catch (e) {
      debugPrint("💡From errorHandler - PlatformException ${e.details['error']}  ");

      throw ServerException(
          e.message ?? 'Something went wrong! Code ${e.code}',e.code ,e.details['error'] ?? "" );
    } catch (e) {
      debugPrint("💡From errorHandler - errors $e  ");
      debugPrint("💡From errorHandler -  ${e is ServerException } ");

      if (e is ServerException) {
      throw ServerException(
        e.message ,
        e.errorCode,
        e.error,
      );
    } else {
      // Si ce n'est pas une ServerException, lancez une exception générique
      throw ServerException('Unknown error ${e.runtimeType}');
    }

    }
  }
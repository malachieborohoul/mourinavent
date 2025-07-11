// import 'package:wenzo/core/background/workmanager_callback.dart';
// import 'package:workmanager/workmanager.dart';

// class WorkManagerService{
//   static  void initialize(){
//     Workmanager().initialize(
//       callbackDispatcher,
//       isInDebugMode: true
//       );
//   }


//   static void registerPeriodicSync(){
//     Workmanager().registerPeriodicTask(
//       "sync_om_transactions", 
//       "syncPendingOmTransactions",
//       frequency: Duration(minutes: 1)
//       );
//   }
// }
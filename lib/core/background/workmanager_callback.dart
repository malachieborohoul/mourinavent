// import 'package:get_it/get_it.dart';
// import 'package:wenzo/features/deposits/domain/repositories/deposits_repository.dart';
// import 'package:wenzo/features/orange_money/domain/repositories/orange_money_repository.dart';
// import 'package:workmanager/workmanager.dart';

// void callbackDispatcher(){
//   Workmanager().executeTask((task, inputData)async{
//     final omRepository = GetIt.instance<OrangeMoneyRepository>();
//     final depositsRepository = GetIt.instance<DepositsRepository>();
//     final pendingOmTransactions =omRepository.getOmTransactions();

//     pendingOmTransactions.fold((f){
      
//     }, (omTransactions) async{
//       for (var omTransaction in omTransactions){
//        var res= await depositsRepository.mobileDeposit(phone: omTransaction.phone, gateway: omTransaction.gateway, amount: omTransaction.amount, );

//        res.fold((l){
//        }, (r){
//         omRepository.deleteOmTransaction(txnid: omTransaction.txnid);
//        });
//       }
//     });

//       return Future.value(true);
    
//   });
// }
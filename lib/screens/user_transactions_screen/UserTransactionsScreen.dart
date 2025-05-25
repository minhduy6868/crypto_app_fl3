import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../admin_managent_screen/admin_management_screen.dart';

class UserTransactionsScreen extends StatelessWidget {
  final String userId;
  final String userName;
  final String userEmail;

  const UserTransactionsScreen({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthenticationRepositoryFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text('$userName\'s Transactions'),
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade50, Colors.white],
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('transactions')
              .where('userId', isEqualTo: userId)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.greenAccent));
            }
            if (snapshot.hasError) {
              if (snapshot.error.toString().contains('FAILED_PRECONDITION')) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'The data is being prepared. Please try again in a few minutes.',
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No transactions found for this user.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            final transactionIds = snapshot.data!.docs.map((doc) => doc.id).toList();
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: transactionIds.length,
              itemBuilder: (context, index) {
                final txId = transactionIds[index];
                return TransactionCard(
                  txId: txId,
                  authRepo: authRepo,
                  key: ValueKey(txId),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
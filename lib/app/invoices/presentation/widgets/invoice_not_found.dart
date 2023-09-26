import 'package:flutter/material.dart';

class InvoiceNotFound extends StatelessWidget {
  const InvoiceNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
                    child: Text(
                      'No invoices found.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
  }
}
//man thanh toan
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ThanhToanPage extends StatelessWidget {
  const ThanhToanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thanh toán'),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Thanh toán',
                style: TextStyle(fontSize: 30),
              ),
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: 600,
                    height: 100,
                    child: Text('Sách 1'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity, // ทำให้ขยายเต็มความกว้างของหน้าจอ
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login.png', // Replace with the path to your image
                height: 250,
              ),
              const SizedBox(height: 30),
              Text(
                'จัดการสินค้า',
                style: TextStyle(
                  fontFamily: 'Prompt',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'บริษัทวิทย์คอม',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sarabun',
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              // Button for Login Page
              SizedBox(
                width: double.infinity, // ปรับให้ปุ่มกว้างเต็มหน้าจอ
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0), // เพิ่มระยะห่างจากขอบซ้ายขวา
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Text(
                      'เข้าสู่ระบบที่นี่',
                      style: TextStyle(
                        fontFamily: 'Sarabun',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Button for Register Page with blue border
              SizedBox(
                width: double.infinity, // ปรับให้ปุ่มกว้างเต็มหน้าจอ
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0), // เพิ่มระยะห่างจากขอบซ้ายขวา
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                    child: Text(
                      'ลงทะเบียนที่นี่',
                      style: TextStyle(
                        fontFamily: 'Sarabun',
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

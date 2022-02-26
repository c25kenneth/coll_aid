import 'package:flutter/material.dart';

class LoanCalculator extends StatefulWidget {
  const LoanCalculator({ Key? key }) : super(key: key);

  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {

  int initialAmount = 0; 
  int annualInterest = 0;  

  double interestRate = 0.0; 
  double dailyInterestCharge = 0.0; 
  double monthlyCharge = 0.0; 
  double yearlyCharge = 0.0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate your Student Loan Interest! '),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 35.0,),
            Container(child: Image.network('https://cdn.pixabay.com/photo/2018/07/03/12/22/mentor-3513738_960_720.jpg'), height: 275, width: 275.0,),       
            Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                      initialAmount = int.parse(val); 
                    });
                  },
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                    
                    hintText: "Amount initially borrowed",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                      annualInterest = int.parse(val); 
                    });
                  },
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                    
                    hintText: "Annual interest in percentage",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              SizedBox(height: 20.0,),
              MaterialButton(
                onPressed: (){
                  setState(() {
                    interestRate = (annualInterest / 100.0) / 365;
                    dailyInterestCharge = interestRate * initialAmount; 
                    monthlyCharge = dailyInterestCharge * 30; 
                    yearlyCharge = monthlyCharge * 12; 
                  });
                  
                },
                child: Text('Calculate your interest rates! '),
                color: Colors.pink[600],
              ),
              SizedBox(height: 30.0,),
              Text('Daily Interest Rate: ' + interestRate.toStringAsFixed(6), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text('Daily Interest Charged: ' + dailyInterestCharge.toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text('Monthly Interest Charged: ' + monthlyCharge.toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text('Yearly Interest Charged: ' + yearlyCharge.toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),), 
          ],
        ),
      ),
    ); 
  }
}
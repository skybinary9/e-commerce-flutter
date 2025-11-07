import 'package:intl/intl.dart';

class MegamartFormatter{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phonenumber){
    if(phonenumber.length ==10){
      return '(${phonenumber.substring(0,3)}) ${phonenumber.substring(3,6)} ${phonenumber.substring(6)}'; 
    }else if(phonenumber.length ==11){
      return '(${phonenumber.substring(0,4)}) ${phonenumber.substring(4,7)} ${phonenumber.substring(7)}'; 
    }
    return phonenumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber){
    //remove any non digit charcters phone number 
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    
    String countryCode = '+${digitsOnly.substring(0,2)}';
    digitsOnly = digitsOnly.substring(2);
    
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode)');


    return phoneNumber; 
  }
}
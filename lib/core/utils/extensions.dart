// extension Extensions on String {
//   String toCurrency() {
//     final num? value = num.tryParse(this);
//     if (value != null) {
//       return '৳${value.toStringAsFixed(2)}';
//     }
//     return this;
//   }

//   String toFormattedDateTime({bool dateOnly = false}) {
//     try {
//       final dateTime = DateTime.parse(this).toLocal();
//       String dateFormat = dateOnly ? 'dd MMM yyyy' : 'dd MMM yyyy, h:mma';
//       return DateFormat(dateFormat).format(dateTime);
//     } catch (e) {
//       return this;
//     }
//   }

//   String to11DigitNumber() {
//     // Remove all non-digit characters
//     String digitsOnly = replaceAll(RegExp(r'\D'), '');

//     // If it starts with '880', replace it with '0'
//     if (digitsOnly.startsWith('880')) {
//       digitsOnly = '0' + digitsOnly.substring(3);
//     }

//     return digitsOnly;
//   }
// }

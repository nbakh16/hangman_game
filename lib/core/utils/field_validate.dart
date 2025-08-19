// class FieldValidate {
//   FieldValidate._();

//   static String? email(String? value) {
//     //nbakh16@gmail.com
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email';
//     }

//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}');

//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }

//     return null; // Valid email
//   }

//   static String? phone(String? value) {
//     //01516503227
//     if (value!.isEmpty || !RegExp(r'^(?:\+[0-9]{11,}|0[0-9]{10,})$').hasMatch(value)) {
//       return 'invalid Phone Number(11 digit)!';
//     }
//     return null;
//   }

//   static String? emailOrPhone(String? value) {
//     //nbakh16@gmail.com or 01516503227
//     if (value!.isEmpty ||
//         !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value) &&
//             !RegExp(r'^(?:\+[0-9]{11,}|0[0-9]{10,})$').hasMatch(value)) {
//       return 'Provide valid phone number or email';
//     }
//     return null;
//   }

//   static String? password(String? value) {
//     //Aa!12345
//     if (value == null || value.isEmpty) {
//       return 'Please enter a password';
//     }

//     if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }

//     if (!value.contains(RegExp(r'[a-z]'))) {
//       return 'Password must contain at least one lowercase letter';
//     }

//     if (!value.contains(RegExp(r'[A-Z]'))) {
//       return 'Password must contain at least one uppercase letter';
//     }

//     if (!value.contains(RegExp(r'\d'))) {
//       return 'Password must contain at least one number';
//     }

//     if (!value.contains(RegExp(r'[@$!%*?&]'))) {
//       return 'Password must contain at least one special character';
//     }

//     return null;
//   }

//   // String? passwordValidator(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Please enter a password';
//   //   }
//   //
//   //   final regex = RegExp(
//   //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
//   //   );
//   //   if (!regex.hasMatch(value)) {
//   //     return 'Password must be at least 8 characters,\n'
//   //         'contain at least one uppercase letter,\n'
//   //         'one lowercase letter,\n'
//   //         'one number, and\n'
//   //         'one special character (@$!%*?&)';
//   //   }
//   //
//   //   return null; // Password is valid
//   // }

//   static String? otp(String? value) {
//     const int otpLength = 6;

//     if (value == null || value.isEmpty) {
//       return 'OTP Code required!';
//     }
//     if (value.length != otpLength) {
//       return 'Enter valid OTP code!';
//     }
//     return null;
//   }
// }

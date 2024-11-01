import 'package:flutter/material.dart';

class OurverButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Color color;

  const OurverButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            top: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
            left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
            right: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
            bottom: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 7,
            ),
          ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.black,
                )
              : Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final String? imagePath; // Make this optional with nullable type

  const RoundButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading = false,
    this.imagePath, // Now optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (imagePath != null &&
                        imagePath!.isNotEmpty) // Check if imagePath is provided
                      Image.asset(
                        imagePath!,
                        width: 24,
                        height: 24,
                      ),
                    if (imagePath != null && imagePath!.isNotEmpty)
                      const SizedBox(
                          width:
                              8), // Add spacing only if imagePath is provided
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    required Null Function(dynamic value) onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          top: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
          left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),
          right: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
          bottom: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 7,
          ),
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          // prefixIcon: prefixIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}

class CustomDropdownFormField extends StatelessWidget {
  final String hintText;
  final String? selectedValue;
  final List<String> items;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;

  const CustomDropdownFormField({
    Key? key,
    required this.hintText,
    this.selectedValue,
    required this.items,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          top: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
          left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),
          right: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
          bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 7),
        ),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        onChanged: (newValue) {
          if (onChanged != null) {
            onChanged!(newValue);
          }
          // Update the controller with the new value if provided
          if (controller != null) {
            controller!.text = newValue ?? '';
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

// class SelectedOption extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;
//   final bool loading;
//   final Color color;

//   const SelectedOption({
//     Key? key,
//     required this.title,
//     required this.onTap,
//     this.loading = false,
//     required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 40,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(20),
//           border: const Border(
//             top: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
//             left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
//             right: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3),
//             bottom: BorderSide(
//               color: Color.fromARGB(255, 0, 0, 0),
//               width: 3,
//             ),
//           ),
//         ),
//         child: Center(
//           child: loading
//               ? const CircularProgressIndicator(
//                   strokeWidth: 3,
//                   color: Colors.black,
//                 )
//               : Padding(
//                   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

class SelectedOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const SelectedOption({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            top: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
            left: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
            right: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3),
            bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../custom_widgets/edit_text_custom.dart';
import '../../resources/color_const.dart';
import 'virtual_keyboard_custom.dart';

class VirtualKeyboardScreen extends StatefulWidget{
  const VirtualKeyboardScreen({super.key});

  @override
  State<VirtualKeyboardScreen> createState() => _VirtualKeyboardScreenState();
}

class _VirtualKeyboardScreenState extends State<VirtualKeyboardScreen> {

  final controllerTextField = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerTextField.addListener(_formatPhoneNumber);

  }

  void _formatPhoneNumber() {
    final text = controllerTextField.text;
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if ((i == 2 || i == 6) && i != digitsOnly.length - 1) {
        buffer.write('-');
      }
    }

    final formatted = buffer.toString();
    if (formatted != text) {
      controllerTextField.value = controllerTextField.value.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final phoneRegex = RegExp(r'^\d{3}-\d{4}-\d{4}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number (e.g., 111-1111-1112)';
    }
    return null;
  }


  @override
  void dispose() {
    super.dispose();
    controllerTextField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_CONST.cornflowerBlue,
        title: const Text("Virtual Keyboard"),
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(50),
            EditTextCustom(
              textController: controllerTextField, 
              hint: '000-0000-0000',
              width: 270,
              showCursor: true,
              readOnly: true,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[\d-]')),
              ],
              onTextChange: (value){

              },
            ),
            const Gap(30),
            Center(
              child: VirtualKeyboardCustom(
                onPressedKey: (value) {
                  if(value.contains("x")){
                    deleteCharacter();
                  }else{
                    if(controllerTextField.text.length >= 13){
                      return;
                    }
                    changeText(value);  
                  }
                },
              ),
            )
          ],
        ),
      )
    ); 
  }

 
  Future<void> deleteCharacter() async{
    final text = controllerTextField.text;
    final selection = controllerTextField.selection;

    // Nếu không có văn bản nào hoặc không có con trỏ được đặt, không làm gì cả
    if (text.isEmpty || !selection.isValid) return;

    // Nếu toàn bộ văn bản được chọn, xóa tất cả
    if (selection.start == 0 && selection.end == text.length) {
      controllerTextField.clear();
      return;
    }

    // Nếu không có văn bản nào được chọn, xóa ký tự tại vị trí con trỏ
    if (selection.start == selection.end) {
      final newText = text.replaceRange(selection.start - 1, selection.start, '');
      controllerTextField.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: selection.start - 1),
      );
      return;
    }

    // Nếu có văn bản được chọn, xóa văn bản được chọn
    final newText = text.replaceRange(selection.start, selection.end, '');
    controllerTextField.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selection.start),
    );
  }

  Future<void> changeText(String value) async{
    // Lấy văn bản hiện tại trong controllerTextField
    final currentText = controllerTextField.text;

    // Tạo văn bản mới bằng cách kết hợp văn bản cũ và văn bản mới
    final newText = '$currentText$value';

    // Cập nhật văn bản cho controllerTextField với vị trí con trỏ hiện tại
    controllerTextField.value = TextEditingValue(
      text: newText, // Văn bản mới
      selection: TextSelection.fromPosition(TextPosition(offset: newText.length)), // Vị trí con trỏ hiện tại
    );
  }
}
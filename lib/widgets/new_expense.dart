import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // while using textEdititing controller which is built in flutter feature we need to
  // to tell flutter that it needs to delete the controller when not required
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount'),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  //This navigator pop takes input of upper context so it
                  // it understands what it needs to close
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}

// *** This is the way to store the data in textfield in every keystorkee *** //

// class _NewExpense extends State<NewExpense> {
//   var _enteredTitle = '';
//   void _saveTitleInput(String inputValue) {
//     _enteredTitle = inputValue;
//     //print(inputValue);
//     // here we are saving each key stroke and hence later accessing it
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           TextField(
//             onChanged: _saveTitleInput,
//             maxLength: 50,
//             keyboardType: TextInputType.multiline,
//             decoration: const InputDecoration(
//               label: Text('Title'),
//             ),
//           ),
//           Row(
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     print(_enteredTitle);
//                   },
//                   child: const Text('Save Expense')),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:expense_app/models/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

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
  DateTime? _datePicked;
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _datePicked = pickedDate;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitButtonHandler() {
    final _enteredAmount = double.tryParse(_amountController.text);
    // tryparse is used here as we want to convert string to number or int / double datatypes

    final amountIsInvalid = _enteredAmount == null || _enteredAmount <= 0;
    // amountIsValid will return true or false
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _datePicked == null) {
      // show error message.
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Text'),
          content: const Text(
              'Please make sure a valid title, amount , date and category was entered'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    } // closed if loop
    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: _enteredAmount,
          date: _datePicked!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
    // this makes sure that the overlay is closed automatically once we have added an expense
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_datePicked == null
                        ? 'No date selected'
                        : formatter.format(_datePicked!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          )))
                      .toList(),
                  onChanged: (value) {
                    print(value);
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  //This navigator pop takes input of upper context so it
                  // it understands what it needs to close
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  // onPressed: () {
                  //   print(_titleController.text);
                  //   print(_amountController.text);
                  // },
                  onPressed: _submitButtonHandler,
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

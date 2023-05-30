import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Utils/data_of_time.dart';
import '../../base/base.dart';
import '../../model/room_category.dart';
import 'add_room_veiw_model.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'addRoom';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseState<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }

  List<RoomCategory> allCats = RoomCategory.getRoomCategories();
  late RoomCategory selectedRoomCategory;
  var fromKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var desController = TextEditingController();
  var dateofbirthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedRoomCategory = allCats[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('AddRoom'),
          ),
          body: Card(
            margin: const EdgeInsets.all(24),
            elevation: 12,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Form(
                  key: fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Create New Room',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Image.asset("assets/images/add_room_image.png"),
                      TextFormField(
                        controller: titleController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter First Room Title ';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                      ),
                      DropdownButton<RoomCategory>(
                          value: selectedRoomCategory,
                          items: allCats.map((cat) {
                            return DropdownMenuItem<RoomCategory>(
                              value: cat,
                              child: Row(
                                children: [
                                  // Image.asset("assets/images/vs-it_computer.png",
                                  // Image.asset("assets/images/hr-management.png",
                                  // Image.asset("assets/images/m-acpi.png",
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/images/${cat.imageName}",
                                      width: 48,
                                      height: 48,
                                    ),
                                  ),
                                  Text(cat.name),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (items) {
                            if (items == null) return;
                            setState(() {
                              selectedRoomCategory = items;
                            });
                          }),
                      TextFormField(
                        controller: aidadatecontroller,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Data";
                          }
                          return null;
                        },
                        onChanged: (String datasaida) {
                          getSaidaName(datasaida);
                        },
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 10),
                          prefixIcon: Icon(
                            Icons.calendar_month_outlined,
                            size: 28,
                          ),
                          labelText: "Data da sandal",
                          labelStyle: TextStyle(fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2036));

                          if (pickeddate != null) {
                            setState(() {
                              var datasaida =
                                  DateFormat('dd-MM-yyyy').format(pickeddate);
                              String dateString = '2021-05-30';
                              DateTime dateTime = DateTime.parse(dateString);
                            });
                          }
                        },
                        style:
                            const TextStyle(fontSize: 21, color: Colors.blue),
                        textAlign: TextAlign.left,
                        cursorColor: Colors.blue,
                      ),
                      TextFormField(
                        controller: desController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter The Address ';
                          }
                          return null;
                        },
                        maxLines: 3,
                        minLines: 3,
                        decoration:
                            const InputDecoration(labelText: ' The Address'),
                      ),
                      TextFormField(
                        controller: dateofbirthController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                        },
                      ),
                      TextFormField(
                        controller: desController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Room Description ';
                          }
                          return null;
                        },
                        maxLines: 3,
                        minLines: 3,
                        decoration: const InputDecoration(
                            labelText: 'Room Description'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                            onPressed: () {
                              submit();
                            },
                            child: const Text('Create')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    if (fromKey.currentState?.validate() == false) {
      return;
    }
    viewModel.addRoom(titleController.text, desController.text,
        selectedRoomCategory.id, dateofbirthController.text);
  }

  @override
  void goBack() {
    Navigator.pop(context);
  }
}

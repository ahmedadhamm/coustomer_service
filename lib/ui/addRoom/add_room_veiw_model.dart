import '../../base/base.dart';
import '../../data_base/my_data_base.dart';
import '../../model/room.dart';

abstract class AddRoomNavigator extends BaseNavigator {
  void goBack();
}

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void addRoom(
    String title,
    String des,
    String catId,
    String text,
  ) async {
    navigator?.showLoadingDialog(message: 'Create Loading...');
    try {
      var res = await MyDataBase.createRoom(Room(
        title: title,
        description: des,
        catId: catId,
      ));
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog(
          'Room Create Successfully,The data will be &'
          'referenced and we will get back to you shortly',
          posActionTitle: 'ok', posAction: () {
        navigator?.goBack();
      }, isDismissible: false);
    } catch (e) {
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog('something went wrong ${e.toString()}');
    }
  }
}

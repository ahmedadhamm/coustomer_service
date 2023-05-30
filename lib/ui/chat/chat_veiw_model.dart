import '../../base/base.dart';
import '../../data_base/my_data_base.dart';
import '../../model/message.dart';
import '../../model/room.dart';
import '../../shared_data.dart';

abstract class ChatNavigator extends BaseNavigator {
  void clearMessageText();
}

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late Room room;

  void send(String messageContent) {
    if (messageContent.trim().isEmpty) return;
    var message = Message(
      content: messageContent,
      dataTime: DateTime.now().microsecondsSinceEpoch,
      senderId: SharedData.user?.id,
      senderName: SharedData.user?.userName,
      roomId: room.id,
    );
    MyDataBase.sendMessage(room.id ?? "", message)
        .then((value) => {
              //clear text filed class chat screen
              navigator?.clearMessageText(),
            })
        .onError((error, stackTrace) => {
              //show error message
              navigator?.showMessageDialog('Something Went Wrong , Try Again',
                  posActionTitle: 'TryAgain', posAction: () {
                send(messageContent);
              }, negActionTitle: 'Cancel'),
            });
  }
}

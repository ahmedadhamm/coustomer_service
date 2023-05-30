class RoomCategory {
  String id;
  String name;
  String imageName;

  RoomCategory({required this.id, required this.name, required this.imageName});

  static List<RoomCategory> getRoomCategories() {
    return [
      RoomCategory(id: 'It', name: 'IT', imageName: 'vs-it_computer.png'),
      RoomCategory(id: 'HR', name: 'HR', imageName: 'hr-management.png'),
      RoomCategory(id: 'ACPI', name: 'ACPI', imageName: 'm-acpi.png'),
    ];
  }

  static RoomCategory getCategoryById(String id) {
    switch (id) {
      case 'IT':
        {
          return RoomCategory(
              id: 'vs-it_computer',
              name: 'IT',
              imageName: 'vs-it_computer.png');
        }
      case 'HR':
        {
          return RoomCategory(
              id: 'HR', name: 'HR', imageName: 'hr-management.png');
        }
      case 'ACPI':
        {
          return RoomCategory(
              id: 'ACPI', name: 'ACPI', imageName: 'm-acpi.png');
        }
    }
    return RoomCategory(id: 'IT', name: 'IT', imageName: 'vs-it_computer.png');
  }
}

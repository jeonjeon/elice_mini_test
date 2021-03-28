import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final int id;
  final String logo_file_url;
  final String title;
  final String fullname;

  CourseModel(
      {required this.id,
      required this.logo_file_url,
      required this.title,
      required this.fullname});

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      logo_file_url: map['logo_file_url'] ?? '',
      title: map['title'] ?? '제목없음',
      fullname: (map['instructors'] as List).isEmpty
          ? '선생님 미등록'
          : map['instructors'][0]['fullname'],
    );
  }

  @override
  List<Object?> get props =>
      [id, logo_file_url, title, fullname]; //id가 같으면 같은 강의로 가정
}

import 'dart:ffi';

class RankingModel {
  final Map<String, dynamic> user;
  final List<Map<String, dynamic>> weekScore;
  
  const RankingModel({
    required this.user,
    required this.weekScore
  });
}
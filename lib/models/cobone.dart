import 'cobone_option.dart';

class Cobone{
  
  List<String>? imagesPaths;
  String? title;
  String? description;
  double? rate;
  int? reviewsNumber;
  bool? isLimited;
  int? boughtCount;
  List<String>? conditions;
  List<String>? highlights;
  List<CoboneOption>? options;

  Cobone({
      this.imagesPaths,
      this.title,
      this.description,
      this.rate,
      this.reviewsNumber,
      this.isLimited,
      this.boughtCount,
      this.conditions,
      this.highlights,this.options,});
}
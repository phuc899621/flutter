import 'package:flutter/material.dart';

abstract class UseCase<type,param>{
  Future<type> call({param? p});
}
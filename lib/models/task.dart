
import 'package:flutter/foundation.dart';
import '../repositories/repository.dart';
import '../repositories/in_memory_cache.dart';

class Task {
  int id;
  String description;
  bool complete;

  Task({
    required this.id,
    this.complete = false,
    this.description = '',
  });

  Task.fromModel(Model? model)
      : id = model?.id ?? 1,
        description = model?.data['description'] ?? '',
        complete = model?.data['complete'];

  Model toModel() =>
      Model(id: id, data: {'description': description, 'complete': complete});

  /*
  Task.fromModel(Model model)
      : id = model.id,
        description = model.data['description'],
        complete = model.data['complete'];

  Model toModel() =>
      Model(id: id, data: {'description': description, 'complete': complete});*/
}
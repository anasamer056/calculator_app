part of 'memory_cubit.dart';

abstract class MemoryState extends Equatable {
  const MemoryState();

  @override
  List<Object> get props => [];
}

class MemoryInitial extends MemoryState {}

class MemoryAdded extends MemoryState {}

class MemoryDeleted extends MemoryState {}

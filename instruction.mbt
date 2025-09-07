///|
/// little-endian load/store instructions for `Memory`
trait Instruction {
  load(view : View[Self], index : Int) -> Self
  store(view : View[Self], index : Int, value : Self) -> Unit
  /// share computer memory without copy 
  from_memory(memory : Memory) -> View[Self]
  /// share computer memory without copy
  to_memory(view : View[Self]) -> Memory
  length(view : View[Self]) -> Int
}

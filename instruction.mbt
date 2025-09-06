///|
/// little-endian load/store instructions for `Memory`
trait Instruction {
  load(view : View[Self], index : Int) -> Self
  store(view : View[Self], index : Int, value : Self) -> Unit
  /// move `memory` ownership to `View`, access previous `memory` is undefined behavior.
  from_memory(memory : Memory) -> View[Self]
  // move `View` ownership to `Memory`, access previous `View` is undefined behavior.
  to_memory(view : View[Self]) -> Memory
  length(view : View[Self]) -> Int
}

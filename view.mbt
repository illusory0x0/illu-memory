///|
pub fn[T : Instruction] View::op_set(
  view : View[T],
  index : Int,
  value : T,
) -> Unit {
  Instruction::store(view, index, value)
}

///|
pub fn[T : Instruction] View::op_get(view : View[T], index : Int) -> T {
  Instruction::load(view, index)
}

///|
pub fn[T : Instruction] View::from_memory(memory : Memory) -> View[T] {
  Instruction::from_memory(memory)
}

///|
pub fn[T : Instruction] View::to_memory(view : View[T]) -> Memory {
  Instruction::to_memory(view)
}

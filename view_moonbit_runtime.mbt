///|
/// 
/// Although `View[T]` declare underlying representation type is `FixedArray[T]`,
/// actually it is underlying representation type is `Memory`.
/// 
/// because `to_memory` and `from_memory` does not change the MoonBit Object's meta data.
/// 
/// use `FixedArray[T]` is in order to use `%fixedarray.unsafe_get` and `%fixedarray.unsafe_set`
/// instructions to implement `load` and `store` functions.
/// 
struct View[T](FixedArray[T])

///|
pub fn[T : Instruction] View::length(view : View[T]) -> Int  {
  Instruction::length(view)
}

///|
fn[T] View::bytes_length(view : View[T]) -> Int = "%fixedarray.length"

///|
fn[T] unsafe_memory_to_view(memory : Memory) -> View[T] = "%identity"

///|
fn[T] unsafe_view_to_memory(view : View[T]) -> Memory = "%identity"

///|
pub impl Instruction for Int with from_memory(memory) {
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for Int with to_memory(view) {
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for Int with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for Int with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for Int with length(view) {
  View::bytes_length(view) >> Int_elem_size_shift
}

///|
pub impl Instruction for UInt with from_memory(memory) {
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for UInt with to_memory(view) {
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for UInt with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for UInt with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for UInt with length(view) {
  View::bytes_length(view) >> UInt_elem_size_shift
}

///|
pub impl Instruction for UInt16 with from_memory(memory) {
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for UInt16 with to_memory(view) {
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for UInt16 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for UInt16 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for UInt16 with length(view) {
  View::bytes_length(view) >> UInt16_elem_size_shift
}

///|
pub impl Instruction for Int16 with from_memory(memory) {
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for Int16 with to_memory(view) {
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for Int16 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for Int16 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for Int16 with length(view) {
  View::bytes_length(view) >> Int16_elem_size_shift
}

///|
pub impl Instruction for Int64 with from_memory(memory) {
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for Int64 with to_memory(view) {
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for Int64 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for Int64 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for Int64 with length(view) {
  View::bytes_length(view) >> Int64_elem_size_shift
}

///|
pub impl Instruction for UInt64 with from_memory(memory) {
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for UInt64 with to_memory(view) {
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for UInt64 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for UInt64 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for UInt64 with length(view) {
  View::bytes_length(view) >> UInt64_elem_size_shift
}

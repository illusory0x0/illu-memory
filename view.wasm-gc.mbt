///|
/// Due to this issue: [#1569](https://github.com/WebAssembly/design/issues/1569),
/// WebAssembly GC drafts implementation would be slower than other MoonBit backends.

///|
struct View[T](Memory)

///|
pub fn[T : Instruction] View::length(view : View[T]) -> Int {
  Instruction::length(view)
}

///|
pub impl Instruction for UInt with load(view, index) {
  load_uint(view.inner(), index)
}

///|
pub impl Instruction for UInt with store(view, index, value) {
  store_uint(view.inner(), index, value)
}

///|
pub impl Instruction for UInt with from_memory(memory) = "%identity"

///|
pub impl Instruction for UInt with to_memory(view) = "%identity"

///|
pub impl Instruction for UInt with length(view) {
  view.inner().length() >> UInt_elem_size_shift
}

///|
pub impl Instruction for Int with load(view, index) {
  load_uint(view.inner(), index).reinterpret_as_int()
}

///|
pub impl Instruction for Int with store(view, index, value) {
  store_uint(view.inner(), index, value.reinterpret_as_uint())
}

///|
pub impl Instruction for Int with from_memory(memory) = "%identity"

///|
pub impl Instruction for Int with to_memory(view) = "%identity"

///|
pub impl Instruction for Int with length(view) {
  view.inner().length() >> Int_elem_size_shift
}

///|
pub impl Instruction for UInt16 with load(view, index) {
  load_uint16(view.inner(), index)
}

///|
pub impl Instruction for UInt16 with store(view, index, value) {
  store_uint16(view.inner(), index, value)
}

///|
pub impl Instruction for UInt16 with from_memory(memory) = "%identity"

///|
pub impl Instruction for UInt16 with to_memory(view) = "%identity"

///|
pub impl Instruction for UInt16 with length(view) {
  view.inner().length() >> UInt16_elem_size_shift
}

///|
pub impl Instruction for Int16 with load(view, index) {
  load_uint16(view.inner(), index).to_int().to_int16()
}

///|
pub impl Instruction for Int16 with store(view, index, value) {
  store_uint16(view.inner(), index, value.reinterpret_as_uint16())
}

///|
pub impl Instruction for Int16 with from_memory(memory) = "%identity"

///|
pub impl Instruction for Int16 with to_memory(view) = "%identity"

///|
pub impl Instruction for Int16 with length(view) {
  view.inner().length() >> Int16_elem_size_shift
}

///|
pub impl Instruction for UInt64 with load(view, index) {
  load_uint64(view.inner(), index)
}

///|
pub impl Instruction for UInt64 with store(view, index, value) {
  store_uint64(view.inner(), index, value)
}

///|
pub impl Instruction for UInt64 with from_memory(memory) = "%identity"

///|
pub impl Instruction for UInt64 with to_memory(view) = "%identity"

///|
pub impl Instruction for UInt64 with length(view) {
  view.inner().length() >> UInt64_elem_size_shift
}

///|
pub impl Instruction for Int64 with load(view, index) {
  load_uint64(view.inner(), index).reinterpret_as_int64()
}

///|
pub impl Instruction for Int64 with store(view, index, value) {
  store_uint64(view.inner(), index, value.reinterpret_as_uint64())
}

///|
pub impl Instruction for Int64 with from_memory(memory) = "%identity"

///|
pub impl Instruction for Int64 with to_memory(view) = "%identity"

///|
pub impl Instruction for Int64 with length(view) {
  view.inner().length() >> Int64_elem_size_shift
}

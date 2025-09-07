///|
struct View[T](FixedArray[T])

///|
pub fn[T : Instruction] View::length(view : View[T]) -> Int = "%fixedarray.length"

///|
fn[A] unsafe_cast_to_ptr(x : A) -> Ptr = "%identity"

///|
fn[A] moonbit_reinterpret_as_pointer(x : A) -> Ptr {
  let ptr : Ptr = unsafe_cast_to_ptr(x)
  moonbit_decref(ptr)
  ptr
}

///|
fn[T] unsafe_memory_to_view(memory : Memory) -> View[T] = "%identity"

///|
fn[T] unsafe_view_to_memory(view : View[T]) -> Memory = "%identity"

///|
pub impl Instruction for Int with from_memory(memory) {
  let ptr = moonbit_reinterpret_as_pointer(memory)
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Int_elem_size_shift,
    memory.length() >> Int_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for Int with to_memory(view) {
  let ptr = moonbit_reinterpret_as_pointer(unsafe_view_to_memory(view))
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Byte_elem_size_shift,
    view.length() << Int_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for Int with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for Int with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for Int with length(view) = "%fixedarray.length"

///|
pub impl Instruction for UInt with from_memory(memory) {
  let ptr = moonbit_reinterpret_as_pointer(memory)
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    UInt_elem_size_shift,
    memory.length() >> UInt_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for UInt with to_memory(view) {
  let ptr = moonbit_reinterpret_as_pointer(unsafe_view_to_memory(view))
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Byte_elem_size_shift,
    view.length() << UInt_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for UInt with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for UInt with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for UInt with length(view) = "%fixedarray.length"

///|
pub impl Instruction for UInt16 with from_memory(memory) {
  let ptr = moonbit_reinterpret_as_pointer(memory)
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    UInt16_elem_size_shift,
    memory.length() >> UInt16_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for UInt16 with to_memory(view) {
  let ptr = moonbit_reinterpret_as_pointer(unsafe_view_to_memory(view))
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Byte_elem_size_shift,
    view.length() << UInt16_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for UInt16 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for UInt16 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for UInt16 with length(view) = "%fixedarray.length"

///|
pub impl Instruction for Int16 with from_memory(memory) {
  let ptr = moonbit_reinterpret_as_pointer(memory)
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Int16_elem_size_shift,
    memory.length() >> Int16_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for Int16 with to_memory(view) {
  let ptr = moonbit_reinterpret_as_pointer(unsafe_view_to_memory(view))
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Byte_elem_size_shift,
    view.length() << Int16_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for Int16 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for Int16 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for Int16 with length(view) = "%fixedarray.length"

///|
pub impl Instruction for Int64 with from_memory(memory) {
  let ptr = moonbit_reinterpret_as_pointer(memory)
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Int64_elem_size_shift,
    memory.length() >> Int64_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for Int64 with to_memory(view) {
  let ptr = moonbit_reinterpret_as_pointer(unsafe_view_to_memory(view))
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Byte_elem_size_shift,
    view.length() << Int64_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for Int64 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for Int64 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for Int64 with length(view) = "%fixedarray.length"

///|
pub impl Instruction for UInt64 with from_memory(memory) {
  let ptr = moonbit_reinterpret_as_pointer(memory)
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    UInt64_elem_size_shift,
    memory.length() >> UInt64_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_memory_to_view(memory)
}

///|
pub impl Instruction for UInt64 with to_memory(view) {
  let ptr = moonbit_reinterpret_as_pointer(unsafe_view_to_memory(view))
  let header = moonbit_make_array_header(
    Moonbit_BLOCK_KIND_VAL_ARRAY,
    Byte_elem_size_shift,
    view.length() << UInt64_elem_size_shift,
  )
  moonbit_set_array_header(ptr, header)
  unsafe_view_to_memory(view)
}

///|
pub impl Instruction for UInt64 with load(view, index) = "%fixedarray.unsafe_get"

///|
pub impl Instruction for UInt64 with store(view, index, value) = "%fixedarray.unsafe_set"

///|
pub impl Instruction for UInt64 with length(view) = "%fixedarray.length"

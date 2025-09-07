///|
#external
type View[T]

///|
pub fn[T : Instruction] View::length(view : View[T]) -> Int {
  Instruction::length(view)
}

///|
extern "js" fn View::from_memory_int32(memory : Memory) -> View[Int] = "(memory) => new Int32Array(memory.buffer,0,memory.buffer.byteLength >>> 2)"

///|
extern "js" fn View::to_memory_int32(view : View[Int]) -> Memory = "(view) => new Uint8Array(view.buffer)"

///|
extern "js" fn View::store_int32(view : View[Int], index : Int, value : Int) = "(view,index,value) => view[index] = value"

///|
extern "js" fn View::load_int32(view : View[Int], index : Int) -> Int = "(view,index)  => view[index]"

///|
extern "js" fn View::length_int32(view : View[Int]) -> Int = "(view) => view.length"

///|
extern "js" fn View::from_memory_uint32(memory : Memory) -> View[UInt] = "(memory) => new Uint32Array(memory.buffer,0,memory.buffer.byteLength >>> 2)"

///|
extern "js" fn View::to_memory_uint32(view : View[UInt]) -> Memory = "(view) => new Uint8Array(view.buffer)"

///|
extern "js" fn View::store_uint32(view : View[UInt], index : Int, value : UInt) = "(view,index,value) => view[index] = value"

///|
extern "js" fn View::load_uint32(view : View[UInt], index : Int) -> UInt = "(view,index) => view[index]"

///|
extern "js" fn View::length_uint32(view : View[UInt]) -> Int = "(view) => view.length"

///|
extern "js" fn View::from_memory_int16(memory : Memory) -> View[Int16] = "(memory) => new Int16Array(memory.buffer,0,memory.buffer.byteLength >>> 1)"

///|
extern "js" fn View::to_memory_int16(view : View[Int16]) -> Memory = "(view) => new Uint8Array(view.buffer)"

///|
extern "js" fn View::store_int16(
  view : View[Int16],
  index : Int,
  value : Int16,
) = "(view,index,value) => view[index] = value"

///|
extern "js" fn View::load_int16(view : View[Int16], index : Int) -> Int16 = "(view,index) => view[index]"

///|
extern "js" fn View::length_int16(view : View[Int16]) -> Int = "(view) => view.length"

///|
extern "js" fn View::from_memory_uint16(memory : Memory) -> View[UInt16] = "(memory) => new Uint16Array(memory.buffer,0,memory.buffer.byteLength >>> 1)"

///|
extern "js" fn View::to_memory_uint16(view : View[UInt16]) -> Memory = "(view) => new Uint8Array(view.buffer)"

///|
extern "js" fn View::store_uint16(
  view : View[UInt16],
  index : Int,
  value : UInt16,
) = "(view,index,value) => view[index] = value"

///|
extern "js" fn View::load_uint16(view : View[UInt16], index : Int) -> UInt16 = "(view,index) => view[index]"

///|
extern "js" fn View::length_uint16(view : View[UInt16]) -> Int = "(view) => view.length"

///|
pub impl Instruction for Int with load(view, index) {
  View::load_int32(view, index)
}

///|
pub impl Instruction for Int with store(view, index, value) {
  View::store_int32(view, index, value)
}

///|
pub impl Instruction for Int with from_memory(memory) {
  View::from_memory_int32(memory)
}

///|
pub impl Instruction for Int with to_memory(view) {
  View::to_memory_int32(view)
}

///|
pub impl Instruction for Int with length(view) {
  View::length_int32(view)
}

///|
pub impl Instruction for UInt with load(view, index) {
  View::load_uint32(view, index)
}

///|
pub impl Instruction for UInt with store(view, index, value) {
  View::store_uint32(view, index, value)
}

///|
pub impl Instruction for UInt with from_memory(memory) {
  View::from_memory_uint32(memory)
}

///|
pub impl Instruction for UInt with to_memory(view) {
  View::to_memory_uint32(view)
}

///|
pub impl Instruction for UInt with length(view) {
  View::length_uint32(view)
}

///|
pub impl Instruction for Int16 with load(view, index) {
  View::load_int16(view, index)
}

///|
pub impl Instruction for Int16 with store(view, index, value) {
  View::store_int16(view, index, value)
}

///|
pub impl Instruction for Int16 with from_memory(memory) {
  View::from_memory_int16(memory)
}

///|
pub impl Instruction for Int16 with to_memory(view) {
  View::to_memory_int16(view)
}

///|
pub impl Instruction for Int16 with length(view) {
  View::length_int16(view)
}

///|
pub impl Instruction for UInt16 with load(view, index) {
  View::load_uint16(view, index)
}

///|
pub impl Instruction for UInt16 with store(view, index, value) {
  View::store_uint16(view, index, value)
}

///|
pub impl Instruction for UInt16 with from_memory(memory) {
  View::from_memory_uint16(memory)
}

///|
pub impl Instruction for UInt16 with to_memory(view) {
  View::to_memory_uint16(view)
}

///|
pub impl Instruction for UInt16 with length(view) {
  View::length_uint16(view)
}

///|
priv struct JsInt64 {
  hi : Int
  lo : Int
}

///|
fn unsafe_js_int64_to_int64(value : JsInt64) -> Int64 = "%identity"

///|
pub impl Instruction for Int64 with load(view, index) {
  let view32 = unsafe_view_int64_to_view_int(view)
  let int32_index = index * 2
  let lo = View::load_int32(view32, int32_index)
  let hi = View::load_int32(view32, int32_index + 1)
  let js_value = JsInt64::{ hi, lo }
  unsafe_js_int64_to_int64(js_value)
}

///|
fn unsafe_int64_to_js_int64(value : Int64) -> JsInt64 = "%identity"

///|
pub impl Instruction for Int64 with store(view, index, value) {
  let view32 = unsafe_view_int64_to_view_int(view)
  let int32_index = index * 2
  let js_value : JsInt64 = unsafe_int64_to_js_int64(value)

  // little-endian
  View::store_int32(view32, int32_index, js_value.lo)
  View::store_int32(view32, int32_index + 1, js_value.hi)
}

///|
fn unsafe_view_int_to_view_int64(view : View[Int]) -> View[Int64] = "%identity"

///|
fn unsafe_view_int64_to_view_int(view : View[Int64]) -> View[Int] = "%identity"

///|
pub impl Instruction for Int64 with from_memory(memory) {
  unsafe_view_int_to_view_int64(View::from_memory_int32(memory))
}

///|
pub impl Instruction for Int64 with to_memory(view) {
  View::to_memory_int32(unsafe_view_int64_to_view_int(view))
}

///|
pub impl Instruction for Int64 with length(view) {
  let view32 = unsafe_view_int64_to_view_int(view)
  View::length_int32(view32) / 2
}

///|
fn unsafe_view_uint64_to_view_int64(view : View[UInt64]) -> View[Int64] = "%identity"

///|
fn unsafe_view_int64_to_view_uint64(view : View[Int64]) -> View[UInt64] = "%identity"

///|
pub impl Instruction for UInt64 with load(view, index) {
  let int64_view = unsafe_view_uint64_to_view_int64(view)
  let int64_value = Instruction::load(int64_view, index)
  Int64::reinterpret_as_uint64(int64_value)
}

///|
pub impl Instruction for UInt64 with store(view, index, value) {
  let int64_view = unsafe_view_uint64_to_view_int64(view)
  let int64_value = UInt64::reinterpret_as_int64(value)
  Instruction::store(int64_view, index, int64_value)
}

///|
pub impl Instruction for UInt64 with from_memory(memory) {
  let int64_view : View[Int64] = Instruction::from_memory(memory)
  unsafe_view_int64_to_view_uint64(int64_view)
}

///|
pub impl Instruction for UInt64 with to_memory(view) {
  let int64_view = unsafe_view_uint64_to_view_int64(view)
  Instruction::to_memory(int64_view)
}

///|
pub impl Instruction for UInt64 with length(view) {
  let int64_view = unsafe_view_uint64_to_view_int64(view)
  Instruction::length(int64_view)
}

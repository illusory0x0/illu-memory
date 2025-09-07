// little-endian

///|
const Byte_elem_size_shift = 0

///|
const Int_elem_size_shift = 2

///|
const UInt_elem_size_shift = 2

///|
const Int16_elem_size_shift = 1

///|
const UInt16_elem_size_shift = 1

///|
const Int64_elem_size_shift = 3

///|
const UInt64_elem_size_shift = 3

///|
fn load_uint(memory : Memory, index : Int) -> UInt {
  let byte_index = index << UInt_elem_size_shift
  let b0 = memory.op_get(byte_index + 0).to_uint() << 0
  let b1 = memory.op_get(byte_index + 1).to_uint() << 8
  let b2 = memory.op_get(byte_index + 2).to_uint() << 16
  let b3 = memory.op_get(byte_index + 3).to_uint() << 24
  b0 | b1 | b2 | b3
}

///|
fn store_uint(memory : Memory, index : Int, value : UInt) -> Unit {
  let byte_index = index << UInt_elem_size_shift
  memory[byte_index + 0] = (value >> 0).to_byte()
  memory[byte_index + 1] = (value >> 8).to_byte()
  memory[byte_index + 2] = (value >> 16).to_byte()
  memory[byte_index + 3] = (value >> 24).to_byte()
}

///|
fn load_uint16(memory : Memory, index : Int) -> UInt16 {
  let byte_index = index << UInt16_elem_size_shift
  let b0 = memory.op_get(byte_index + 0).to_uint16() << 0
  let b1 = memory.op_get(byte_index + 1).to_uint16() << 8
  b0 | b1
}

///|
fn store_uint16(memory : Memory, index : Int, value : UInt16) -> Unit {
  let byte_index = index << UInt16_elem_size_shift
  memory[byte_index + 0] = (value >> 0).to_byte()
  memory[byte_index + 1] = (value >> 8).to_byte()
}

///|
fn load_uint64(memory : Memory, index : Int) -> UInt64 {
  let byte_index = index << UInt64_elem_size_shift
  let b0 = memory.op_get(byte_index + 0).to_uint64() << 0
  let b1 = memory.op_get(byte_index + 1).to_uint64() << 8
  let b2 = memory.op_get(byte_index + 2).to_uint64() << 16
  let b3 = memory.op_get(byte_index + 3).to_uint64() << 24
  let b4 = memory.op_get(byte_index + 4).to_uint64() << 32
  let b5 = memory.op_get(byte_index + 5).to_uint64() << 40
  let b6 = memory.op_get(byte_index + 6).to_uint64() << 48
  let b7 = memory.op_get(byte_index + 7).to_uint64() << 56
  b0 | b1 | b2 | b3 | b4 | b5 | b6 | b7
}

///|
fn store_uint64(memory : Memory, index : Int, value : UInt64) -> Unit {
  let byte_index = index << UInt64_elem_size_shift
  memory[byte_index + 0] = (value >> 0).to_byte()
  memory[byte_index + 1] = (value >> 8).to_byte()
  memory[byte_index + 2] = (value >> 16).to_byte()
  memory[byte_index + 3] = (value >> 24).to_byte()
  memory[byte_index + 4] = (value >> 32).to_byte()
  memory[byte_index + 5] = (value >> 40).to_byte()
  memory[byte_index + 6] = (value >> 48).to_byte()
  memory[byte_index + 7] = (value >> 56).to_byte()
}

///|
const Size_of_Byte = 1

///|
const Size_of_Int = 4

///|
const Size_of_UInt = 4

///|
const Size_of_Int16 = 2

///|
const Size_of_UInt16 = 2

///|
const Size_of_Int64 = 8

///|
const Size_of_UInt64 = 8

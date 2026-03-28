/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
import { toBase64StringUtf8Arkts, toBase64StringArkts, fromBase64StringArkts, fromBase64StringUtf8Arkts, fromBase64Uint8Array } from "libcangjie_base64.so";


export function encode_Uint8Array(data: Uint8Array): string {
  return toBase64StringUtf8Arkts(data)
}

export function encode_String(data: string): string {
  return toBase64StringArkts(data)
}

export function decode_string(data: string): string {
  return fromBase64StringArkts(data)
}

export function decode_String_toUint8Array(data: string): Uint8Array {
  return new Uint8Array(fromBase64StringUtf8Arkts(data))
}

export function decode_Uint8Array(data: Uint8Array): Uint8Array {
  return  new Uint8Array(fromBase64Uint8Array(data))
}

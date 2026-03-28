/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
import { requireCJLib } from "libark_interop_loader.so";
import { CustomLib } from "libark_interop_api.so";


const cjlib = requireCJLib("libcangjie_base64.so") as CustomLib

export function encode_Uint8Array(data: Uint8Array): string {
  return cjlib.toBase64StringUtf8Arkts(data)
}

export function encode_String(data: string): string {
  return cjlib.toBase64StringArkts(data)
}

export function decode_string(data: string): string {
  return cjlib.fromBase64StringArkts(data)
}

export function decode_String_toUint8Array(data: string): Uint8Array {
  return new Uint8Array(cjlib.fromBase64StringUtf8Arkts(data))
}

export function decode_Uint8Array(data: Uint8Array): Uint8Array {
  return  new Uint8Array(cjlib.fromBase64Uint8Array(data))
}

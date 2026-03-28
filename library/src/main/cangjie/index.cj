/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
package cangjie_base64

import ohos.ark_interop.*
import ohos.ark_interop_macro.*
import ohos.ark_interop_helper.*
import ohos.base.*
import stdx.encoding.base64.*

@Interop[ArkTS]
public func toBase64StringArkts(data: String): String {
    return toBase64String(data.toArray())
}

@Interop[ArkTS]
public func fromBase64StringArkts(data: String): String {
    var opArr: Option<Array<Byte>> = fromBase64String(data)
    var result = match (opArr) {
        case Some(s) => unsafe { String.fromUtf8Unchecked(s)}
        case None => ''
    }
    return result
}

@Interop[ArkTS]
public func toBase64StringUtf8Arkts(data: Array<Byte>): String {
    return toBase64String(data)
}

@Interop[ArkTS]
public func fromBase64StringUtf8Arkts(data: String): Array<Byte> {
    var opArr: Option<Array<Byte>> = fromBase64String(data)
    var result: Array<Byte> = match (opArr) {
        case Some(s) => s
        case None => Array<Byte>()
    }
    return result
}

@Interop[ArkTS]
public func fromBase64Uint8Array(data: Array<Byte>): Array<Byte> {
    var opArr: Option<Array<Byte>> = fromBase64String(String.fromUtf8(data))
    var result: Array<Byte> = match (opArr) {
        case Some(s) => s
        case None => Array<Byte>()
    }
    return result
}
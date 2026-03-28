/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
import { util } from '@kit.ArkTS';

export class Unit8ArrayUtils {
  public static Uint8ArrayToString(array: Uint8Array): string {
    let out: string = '';
    let i: number = 0;
    let len: number = 0;
    let c: number = -1;
    let char2: number = -1;
    let char3: number = -1;
    let tempAry: Uint8Array = array;
    len = tempAry.length;
    i = 0;
    while (i < len) {
      c = tempAry[i++];
      switch (c >> 4) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
          // 0xxxxxxx
          out += String.fromCharCode(c);
          break;
        case 12:
        case 13:
          // 110x xxxx   10xx xxxx
          char2 = tempAry[i++];
          out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
          break;
        case 14:
          // 1110 xxxx  10xx xxxx  10xx xxxx
          char2 = tempAry[i++];
          char3 = tempAry[i++];
          out += String.fromCharCode(((c & 0x0F) << 12) |
            ((char2 & 0x3F) << 6) |
            ((char3 & 0x3F) << 0));
          break;
      }
    }
    return out;
  }

  public static stringToUint8Array(string: string) {

    let pos = 0;
    const len = string.length;
    const out = [];
    let at = 0; // output position
    let tlen = Math.max(32, len + (len >> 1) + 7); // 1.5x size
    let target = new Uint8Array((tlen >> 3) << 3); // ... but at 8 byte offset
    while (pos < len) {
      let value = string.charCodeAt(pos++);
      if (value >= 0xd800 && value <= 0xdbff) {
        // high surrogate
        if (pos < len) {
          const extra = string.charCodeAt(pos);
          if ((extra & 0xfc00) === 0xdc00) {
            ++pos;
            value = ((value & 0x3ff) << 10) + (extra & 0x3ff) + 0x10000;
          }
        }
        if (value >= 0xd800 && value <= 0xdbff) {
          continue; // drop lone surrogate
        }
      }
      // expand the buffer if we couldn't write 4 bytes
      if (at + 4 > target.length) {
        tlen += 8; // minimum extra
        tlen *= (1.0 + (pos / string.length) * 2); // take 2x the remaining
        tlen = (tlen >> 3) << 3; // 8 byte offset
        const update = new Uint8Array(tlen);
        update.set(target);
        target = update;
      }
      if ((value & 0xffffff80) === 0) { // 1-byte
        target[at++] = value; // ASCII
        continue;
      } else if ((value & 0xfffff800) === 0) { // 2-byte
        target[at++] = ((value >> 6) & 0x1f) | 0xc0;
      } else if ((value & 0xffff0000) === 0) { // 3-byte
        target[at++] = ((value >> 12) & 0x0f) | 0xe0;
        target[at++] = ((value >> 6) & 0x3f) | 0x80;
      } else if ((value & 0xffe00000) === 0) { // 4-byte
        target[at++] = ((value >> 18) & 0x07) | 0xf0;
        target[at++] = ((value >> 12) & 0x3f) | 0x80;
        target[at++] = ((value >> 6) & 0x3f) | 0x80;
      } else {
        continue;
      }
      target[at++] = (value & 0x3f) | 0x80;
    }
    return target.subarray(0, at);
  }

  public static generateRandomArray(length: number): Uint8Array {
    const array = new Uint8Array(length);
    for (let i = 0; i < length; i++) {
      array[i] = Math.floor(Math.random() * 256);
    }
    return array;
  }
  // 随机生成 1M 数据
  public static generateRandomString(length: number): string {
    const arr = Unit8ArrayUtils.generateRandomArray(length)
    let textDecoder = util.TextDecoder.create('utf-8');
    return textDecoder.decodeToString(arr);
  }
 // 将字符串转ArrayBuffer
  public static StringToArrayBuffer(str: string): ArrayBuffer {
    const byteArray = new util.TextEncoder().encodeInto(str)
    const buffer = new ArrayBuffer(byteArray.length);
    const view = new Uint8Array(buffer);
    // 填充数据
    byteArray.forEach((value, index) => {
      view[index] = value;
    });

    return buffer
  }

}

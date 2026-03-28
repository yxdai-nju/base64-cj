/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
import util from '@ohos.util';
import { Unit8ArrayUtils } from './common/Unit8ArrayUtils';
import { systemDateTime } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {Base64} from '@ohos/base64'

@Entry
@Component
struct OhosBase64Example {
  private data: Uint8Array = new Uint8Array([104, 101, 108, 108, 111, 32, 99, 97, 110, 103, 106, 105, 101])
  @State encodeResult: string = ""
  @State decodeResult: string = ""

  private testEncodeString(count: number, str: Uint8Array): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.encodeResult = Base64.encodeToString(str)
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'OhosBase64', '%{public}s', `OhosBase64Encode______${count}: ${(end - start) / count}ns/op`);
  }
  private testDecodeString(count: number, str: string): void {
    const start = systemDateTime.getTime(true)
    hilog.error(0x0000, 'OhosBase64', '%{public}s', `OhosBase64Encode__222--${str}---${Base64.stringToBytes(str)}}`);
    for (let i = 0; i < count; i++) {
      this.decodeResult = Base64.bytesToString(Base64.decode(str))
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'OhosBase64', '%{public}s', `OhosBase64Decode______${count}: ${(end - start) / count}ns/op`);
  }

  build() {
    Row() {
      Column() {
        Text("Base64Example").fontSize(16)

        Button("encode_10")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testEncodeString(10, this.data)
          }).margin(10)
        // Button("encode_100")
        //   .width(200)
        //   .onClick((event: ClickEvent) => {
        //     this.testEncodeString(100, this.data)
        //   }).margin(10)
        // Button("encode_1000")
        //   .width(200)
        //   .onClick((event: ClickEvent) => {
        //     this.testEncodeString(1000, this.data)
        //   }).margin(10)
        // Button("encode_10000")
        //   .width(200)
        //   .onClick((event: ClickEvent) => {
        //     this.testEncodeString(10000, this.data)
        //   }).margin(10)
        //------------------
        Button("decode_10")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeString(10, this.encodeResult)
          }).margin(10)
        // Button("decode_100")
        //   .width(200)
        //   .onClick((event: ClickEvent) => {
        //     this.testDecodeString(100, this.encodeResult)
        //   }).margin(10)
        // Button("decode_1000")
        //   .width(200)
        //   .onClick((event: ClickEvent) => {
        //     this.testDecodeString(1000, this.encodeResult)
        //   }).margin(10)
        // Button("decode_10000")
        //   .width(200)
        //   .onClick((event: ClickEvent) => {
        //     this.testDecodeString(10000, this.encodeResult)
        //   }).margin(10)

        Button("结果")
          .width(200)
          .onClick((event: ClickEvent) => {
            hilog.error(0x0000, 'OhosBase64', '%{public}s', `原数据: ${this.data}`);
            hilog.error(0x0000, 'OhosBase64', '%{public}s', `encode: ${this.encodeResult}`);
            hilog.error(0x0000, 'OhosBase64', '%{public}s', `decode: ${this.decodeResult}`);
          }).margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}



import { hilog } from "@kit.PerformanceAnalysisKit";
import { Unit8ArrayUtils } from "./common/Unit8ArrayUtils";
import { systemDateTime } from "@kit.BasicServicesKit";

import { encode_String, decode_string } from "@cangjie-tpc/base64"
@Entry
@Component
struct CangjieBase64Example {
  private data: string = "hello cangjie"
  @State encodeResult: string = ''
  @State decodeResult: string = ''

  // 与base64 比较
  private testEncodeString(count: number, str: string): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.encodeResult = encode_String(str)
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `CangjieBase64StringEncode______${count}: ${(end - start) / count}ns/op`);
  }
  private testDecodeString(count: number, str: string): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.decodeResult = decode_string(str)
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `CangjieBase64StringDecode______${count}: ${(end - start) / count}ns/op`);
  }


  build() {
    Row() {
      Column() {
        Text("CangjieBase64Example").fontSize(16)

        Button("encode_10")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testEncodeString(10, this.data)
          }).margin(10)
        Button("encode_100")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testEncodeString(100, this.data)
          }).margin(10)
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
        Button("decode_100")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeString(100, this.encodeResult)
          }).margin(10)
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
            // hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `原数据: ${this.data}`);
            // let a = lib.toBase64StringArkts(this.data)
            // hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `encode: ${a}`);
            // let b = lib.fromBase64StringArkts(a)
            // hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `decode: ${b}`);

            hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `原数据: ${this.data}`);
            hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `encode: ${this.encodeResult}`);
            hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `decode: ${this.decodeResult}`);
          }).margin(10)

      }
      .width('100%')
    }
    .height('100%')
  }
}
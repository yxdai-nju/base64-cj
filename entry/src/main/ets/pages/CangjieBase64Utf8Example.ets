
import { hilog } from "@kit.PerformanceAnalysisKit";
import { Unit8ArrayUtils } from "./common/Unit8ArrayUtils";
import { systemDateTime } from "@kit.BasicServicesKit";
import { encode_Uint8Array, decode_Uint8Array, decode_String_toUint8Array } from "@cangjie-tpc/base64"

@Entry
@Component
struct CangjieBase64Utf8Example {
  private data: Uint8Array = Unit8ArrayUtils.stringToUint8Array("hello cangjie")
  @State encodeResult: string = ""
  @State decodeResult: Uint8Array = new Uint8Array(this.data.byteLength)

  // 与base64 比较
  private testEncodeString(count: number, str: Uint8Array): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.encodeResult = encode_Uint8Array(str)
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'CangjieBase64Utf8', '%{public}s', `CangjieBase64Utf8Encode______${count}: ${(end - start) / count}ns/op`);
  }
  private testDecodeString(count: number, str: string): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.decodeResult = (decode_String_toUint8Array(str))
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'CangjieBase64Utf8', '%{public}s', `CangjieBase64Utf8Decode______${count}: ${(end - start) / count}ns/op`);
  }

  private testDecodeUint8Array(count: number, str: Uint8Array): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.decodeResult = (decode_Uint8Array(str))
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'CangjieBase64Utf8', '%{public}s', `CangjieBase64Utf8Decode______${count}: ${(end - start) / count}ns/op`);
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
        Button("encode_1000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testEncodeString(100, this.data)
          }).margin(10)
        Button("encode_1000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testEncodeString(1000, this.data)
          }).margin(10)
        Button("encode_10000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testEncodeString(10000, this.data)
          }).margin(10)
        //------------------
        Button("decode_10")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeUint8Array(10, Unit8ArrayUtils.stringToUint8Array(this.encodeResult))
          }).margin(10)
        Button("decode_1000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeUint8Array(100, Unit8ArrayUtils.stringToUint8Array(this.encodeResult))
          }).margin(10)
        Button("decode_1000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeUint8Array(1000, Unit8ArrayUtils.stringToUint8Array(this.encodeResult))
          }).margin(10)
        Button("decode_10000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeUint8Array(10000, Unit8ArrayUtils.stringToUint8Array(this.encodeResult))
          }).margin(10)

        Button("结果")
          .width(200)
          .onClick((event: ClickEvent) => {
            hilog.error(0x0000, 'CangjieBase64Utf8', '%{public}s', `原数据: ${JSON.stringify(Array.from(new Uint8Array(this.data)))}`);
            hilog.error(0x0000, 'CangjieBase64Utf8', '%{public}s', `encode: ${this.encodeResult}`);
            hilog.error(0x0000, 'CangjieBase64Utf8', '%{public}s', `decode: ${JSON.stringify(Array.from(new Uint8Array(this.decodeResult)))}`);
          }).margin(10)

      }
      .width('100%')
    }
    .height('100%')
  }
}
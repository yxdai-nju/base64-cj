/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
import { systemDateTime } from '@kit.BasicServicesKit'
import { hilog } from '@kit.PerformanceAnalysisKit';
import { atob, btoa } from './common/base64';

@Entry
@Component
struct Base64Example {
  private data: string = "hello cangjie"
  @State encodeResult: string = ''
  @State decodeResult: string = ''

  private testEncodeString(count: number, str: string): void {
    const start = systemDateTime.getTime(true)
    hilog.error(0x0000, 'Base64', '%{public}s', `Base64Encode______1`);
    for (let i = 0; i < count; i++) {
      this.encodeResult = btoa(str)
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'Base64', '%{public}s', `Base64Encode______${count}: ${(end - start) / count}ns/op`);
  }
  private testDecodeString(count: number, str: string): void {
    const start = systemDateTime.getTime(true)
    for (let i = 0; i < count; i++) {
      this.decodeResult = atob(str)
    }
    const end = systemDateTime.getTime(true)
    hilog.error(0x0000, 'Base64', '%{public}s', `Base64Decode______${count}: ${(end - start) / count}ns/op`);
  }

  build() {
    Row() {
      Column() {
        Text("Base64Example").fontSize(16)

        Button("encode_10")
          .width(200)
          .onClick((event: ClickEvent) => {
            // this.testEncodeString(10, this.data)
            this.encodeResult = btoa(this.data)
            hilog.error(0x0000, 'Base64', '%{public}s', `Base64Encode______111${this.encodeResult}`);
          }).margin(10)
        Button("encode_100")
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
            this.testDecodeString(10, this.encodeResult)
          }).margin(10)
        Button("decode_100")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeString(100, this.encodeResult)
          }).margin(10)
        Button("decode_1000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeString(1000, this.encodeResult)
          }).margin(10)
        Button("decode_10000")
          .width(200)
          .onClick((event: ClickEvent) => {
            this.testDecodeString(10000, this.encodeResult)
          }).margin(10)

        Button("结果")
          .width(200)
          .onClick((event: ClickEvent) => {
            hilog.error(0x0000, 'Base64', '%{public}s', `原数据: ${this.data}`);
            hilog.error(0x0000, 'Base64', '%{public}s', `encode: ${this.encodeResult}`);
            hilog.error(0x0000, 'Base64', '%{public}s', `decode: ${this.decodeResult}`);
          }).margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
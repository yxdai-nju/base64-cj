/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */
import router from '@ohos.router'

@Entry
@Component
struct Index {

  build() {
      Column(){
        Button('ohos_base64_utf8').backgroundColor(0x317aff).fontSize(18).width(200).height(40).onClick(() => {
          router.pushUrl({
            url: 'pages/OhosBase64Example',
          });
        }).margin(10)
        Button('base64').backgroundColor(0x317aff).fontSize(18).width(200).height(40).onClick(() => {
          router.pushUrl({
            url: 'pages/Base64Example',
          });
        }).margin(10)
        Button('base64-js').backgroundColor(0x317aff).fontSize(18).width(200).height(40).onClick(() => {
          router.pushUrl({
            url: 'pages/Base64JsExample',
          });
        }).margin(10)
        Button('cangjie_base64').backgroundColor(0x317aff).fontSize(18).width(200).height(40).onClick(() => {
          router.pushUrl({
            url: 'pages/CangjieBase64Example',
          });
        }).margin(10)
        Button('cangjie_base64_utf8').backgroundColor(0x317aff).fontSize(18).width(200).height(40).onClick(() => {
          router.pushUrl({
            url: 'pages/CangjieBase64Utf8Example',
          });
        }).margin(10)

    }
    .height('100%')
    .width('100%')
  }
}
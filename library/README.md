<div align="center">
<h1>base64-cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v1.0.0-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.53.20-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-NA-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

ArkTS 调用 Cangjie 版 base64 编解码算法实现。

## 特性

- 支持 ArkTS 调用 Cangjie 版 base64 编解码

### 源码目录

```shell
├─ AppScope
├─ entry                 # 示例代码
├─ hvigor                # 构建工具             
├─ library               # 源码文件夹                   
│  └─ src
│      └─ main
│          ├─ cangjie    # cangjie 和 ArkTS 互操作代码
│          ├─ ets        # ets 对外接口
│          └─ resources
└─ README.md             # 库使用介绍
```
## 接口说明

```
/*
 * 将 ArrayBuffer 数据转换为 base64。
 * 
 * 参数 data - 原始数据
 * 返回值 string - base64 数据
 */
function encode_Uint8Array(data: ArrayBuffer): string 

/*
 * 将 base64 数据转换为 ArrayBuffer
 * 
 * 参数 data - base64 数据
 * 返回值 ArrayBuffer - 原始数据
 */
function decode_Uint8Array(data: ArrayBuffer): ArrayBuffer

/*
 * 将 string 类型数据转换为 base64。
 * 
 * 参数 data - 原始数据
 * 返回值 string - base64 数据
 */
function encode_String(data: string): string

/*
 * 将 base64 数据转换为 string 数据。
 * 
 * 参数 data - base64 数据
 * 返回值 string - 原始数据
 */
function decode_string(data: string): string

/*
 * 将 base64 数据转换为 ArrayBuffer 数据。
 * 
 * 参数 data - base64 数据
 * 返回值 ArrayBuffer - 原始数据
 */
function decode_String_toUint8Array(data: string): ArrayBuffer
```

## 使用说明

1. 通过中心仓下载安装

    ```text
    ohpm install @cangjie-tpc/base64
    ```

2. 通过 module 引入
   1. 克隆下载项目。
   2. 将 library 模块拷贝到应用项目下。
   3. 修改自身应用 entry 下的 oh-package.json5 文件，在 dependencies 字段添加：
      ```json
      {
         "dependencies": {
            "@cangjie-tpc/base64": "file:../library"
         }
      }
      ```
   4. 在项目中使用以下方式引入：
      ```cangjie
      import { encode_String, decode_string, encode_Uint8Array, decode_Uint8Array, decode_String_toUint8Array } from "@cangjie-tpc/base64cj"
      ```
## 功能示例

encode_String 和 decode_string 使用如下：

```ets
import { encode_String, decode_string } from "@cangjie-tpc/base64cj"
@Entry
@Component
struct CangjieBase64Example {
  private data: string = "hello cangjie"
  @State encodeResult: string = ''
  @State decodeResult: string = ''
    
  build() {
    Row() {
      Column() {
        Button("encode")
          .width(200)
          .onClick((event: ClickEvent) => {
             hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `原数据: ${this.data}`);
             this.encodeResult = encode_String(this.data)
             hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `encode: ${this.encodeResult}`);
          }).margin(10)
                
        Button("decode")
          .width(200)
          .onClick((event: ClickEvent) => {
             hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `原数据: ${this.encodeResult}`);
             this.decodeResult = decode_string(this.encodeResult)
             hilog.error(0x0000, 'CangjieBase64String', '%{public}s', `decode: ${this.decodeResult}`);
          }).margin(10)    

      }
      .width('100%')
    }
    .height('100%')
  }
}
```

encode_Uint8Array 和 decode_Uint8Array 使用如下：

```ets
import { encode_Uint8Array, decode_String_toUint8Array } from "@cangjie-tpc/base64cj"
@Entry
@Component
struct CangjieBase64Example {
  private data: ArrayBuffer = Unit8ArrayUtils.StringToArrayBuffer("hello cangjie")
  @State encodeResult: string = ''
    
  build() {
    Row() {
      Column() {
        Button("encode")
          .width(200)
          .onClick((event: ClickEvent) => {
             this.encodeResult = encode_Uint8Array(this.data)
          }).margin(10)
                
        Button("decode")
          .width(200)
          .onClick((event: ClickEvent) => {
             const decodeResult = decode_String_toUint8Array(this.encodeResult)
          }).margin(10)    

      }
      .width('100%')
    }
    .height('100%')
  }
}
```

## 约束与限制

在下述版本验证通过：

    DevEco Studio 5.0.13.210
    Cangjie Support Plugin 5.0.13.210

## 开源协议

本项目基于 [Apache License 2.0](./LICENSE)，请自由的享受和参与开源。

## 参与贡献

欢迎给我们提交 PR，欢迎给我们提交 Issue，欢迎参与任何形式的贡献。

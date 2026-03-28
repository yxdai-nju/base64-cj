export declare interface CustomLib {
    toBase64StringArkts(data: string): string
    fromBase64StringArkts(data: string): string
    toBase64StringUtf8Arkts(data: ArrayBuffer): string
    fromBase64StringUtf8Arkts(data: string): ArrayBuffer
    fromBase64Uint8Array(data: ArrayBuffer): ArrayBuffer
}
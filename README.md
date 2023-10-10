# Gits Flutter Starter Kit

Flutter starter kit menggunakan sistem modular supaya lebih memudahkan untuk kolaborasi dan maintenance. Di bantu dengan Gits CLI automation yang mengurangi boilerplate from scratch.

## Setup Development

Version:

- Flutter: 3.7.0 - Latest Version
- Android: 19 - Latest Version
- iOS: 11.0 - Latest Version
- Environment: Development, Staging & Production

Prasyarat proyek:

1. Install `gits_cli`

    ```sh
    dart pub global activate gits_cli
    ```

2. Lakukan perintah `gits_cli doctor` dan pastikan berjalan tanpa error.

    ```sh
    gits_cli doctor

    output:
    [✓] Flutter installed
    Doctor summary (to see all details, run flutter doctor -v):
    [✓] Flutter (Channel stable, 3.7.7, on macOS 13.0 22A380 darwin-arm64, locale en-ID)
    [✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
    [✓] Xcode - develop for iOS and macOS (Xcode 14.1)
    [✓] Chrome - develop for the web
    [✓] Android Studio (version 2021.1)
    [✓] VS Code (version 1.77.0)
    [✓] Connected device (3 available)
    [✓] HTTP Host Availability

    • No issues found!
    [✓] Gherkin installed
    [✓] lcov installed
    ```

Langkah _run_ proyek:

1. Masuk ke direktori proyek.
2. Minta file `gits.yaml` ke rekan project bila tidak ada lakukan perinah `gits_cli init`.
3. Lakukan perintah `gits_cli get && gits_cli config`.
4. Untuk _run_ proyek aplikasi, pilih perangkat yang digunakan dan lakukan perintah Run `gits_cli run -f dev`.

## Command Gits Cli

untuk info lebih lanjut tentang `gits_cli` bisa di lihat pada [Documentasi Gits Cli](https://pub.dev/packages/gits_cli)

## Arsitektur

Framework:

- Gits Flutter Starter Kit
- BLoC
- Get it

Direktori:

- `assets`: Direktori yang berisi semua file aset.
- `core`: Direktori yang berisi semua file termasuk library dan modul.
- `android`: Direktori yang berisi modul untuk android.
- `ios`: Direktori yang berisi modul untuk ios.
- `feature`: Direktori yang berisi modul fitur aplikasi.
- `firebase`: Direktori yang berisi file google service yang di kategorikan oleh environtment.
- `json2dart`: Direkotri yang berisikan file json2dart.yaml dan json untuk generate otomatis integrasi api.
- `lib`: Direktori yang berisikan file utama proyek.

Third Party:

- Firebase

## Link API

Documentasi: <https://reqres.in/>

## Link Design

Figma: <https://figma.com>

## Integration Test

Integration test we use with gits_cucumber and gits_cli for support gherkin language.
[Documentation Integration Test](./integration_test/README)

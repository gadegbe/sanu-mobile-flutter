#!/bin/bash
# Parse command line arguments
while getopts ":v:" opt; do
    case ${opt} in
    v)
        app_version=$OPTARG
        ;;
    \?)
        echo "Invalid option: -$OPTARG" 1>&2
        exit 1
        ;;
    :)
        echo "Invalid option: -$OPTARG requires an argument" 1>&2
        exit 1
        ;;
    esac
done
shift $((OPTIND - 1))

# Set default app version if not provided
if [ -z "$app_version" ]; then
    echo "Option -v is required" 1>&2
    exit 1
fi

# Clean the project
flutter clean

# Get the dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Build IPA and App Bundle in parallel
build_number=$(git rev-list --count HEAD)
build_number=$((build_number + 1000))

flutter build ipa --split-debug-info=build/app/outputs/symbols/ios -t lib/main_production.dart --flavor production --release --build-number=$build_number --build-name=$app_version &
flutter build appbundle --split-debug-info=build/app/outputs/symbols/android -t lib/main_production.dart --flavor production --release --build-number=$build_number --build-name=$app_version &

# Wait for both tasks to finish
wait

echo "Build completed successfully! ✅"

xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa -u gadegbea@icloud.com -p "$ALTOOL_PASSWORD" &

wait

echo "Upload completed successfully! ✅"

firebase crashlytics:symbols:upload --app=1:332557843282:android:94b218ddabfd7d0857588b build/app/outputs/symbols/android
wait

firebase crashlytics:symbols:upload --app=1:332557843282:ios:c6a5a10ac1af725057588b build/app/outputs/symbols/ios
wait

echo "Upload symbols successfully! ✅"

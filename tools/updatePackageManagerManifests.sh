#!/bin/zsh

# updates Package.swift to contain matching xcframework-download-url and -checksum for given VERSION_NAME
# preconditions: 
#   - env var VERSION_NAME must be set to a semantic version string like "1.0.2"
#   - HybridlocSDK_v$(VERSION_NAME).xcframework.zip must exist in parent folder

# switch to parent folder as working dir
cd ..

# 1. check preconditions
if [ -z "$VERSION_NAME" ]; then
    echo "No VERSION_NAME given."
    exit 1
fi

SEMANTIC_VERSION_REGEX="[0-9]+\.[0-9]+\.[0-9]+"

if [[ ! "$VERSION_NAME" =~ ^$SEMANTIC_VERSION_REGEX\$ ]]; then
    echo "Invalid VERSION_NAME given: '$VERSION_NAME'. Please use semantic version strings." 2>&1
    exit 1
fi

XCFRAMEWORK_ZIP_NAME="HybridlocSDK_v$VERSION_NAME.xcframework.zip"
if [ ! -f "$XCFRAMEWORK_ZIP_NAME" ]; then
    echo "XCFRAMEWORK_ZIP_NAME not found at expected path '$XCFRAMEWORK_ZIP_NAME'" 2>&1
    exit 1
fi

# 2. define helper function for string replacements
function replaceStringInFile() {
    FILE="$1"
    SOURCE_STRING="$2"
    REPLACEMENT_STRING="$3"
    TEXTUAL_DESC="$4"

    if sed -E -i '' "s/$SOURCE_STRING/$REPLACEMENT_STRING/g" "$FILE"; then
        if grep -q "$REPLACEMENT_STRING" "$FILE"; then
            echo "Successfully updated $TEXTUAL_DESC in $FILE"
        else 
            echo "Failed updating $TEXTUAL_DESC in $FILE. Didn't find expected replacement string." 2>&1
            exit 1
        fi
    else
        echo "Failed updating $TEXTUAL_DESC in $FILE. sed exited with error." 2>&1
        exit 1
    fi
}

# 3. Package.swift: replace download url
URL_BASE_PATH="https:\/\/github.com\/wanzl-gmbh\/ios-hybridloc-sdk\/releases\/download"
URL_PATH_SUFFIX="HybridlocSDK_v$SEMANTIC_VERSION_REGEX.xcframework.zip"
URL_SOURCE="$URL_BASE_PATH\/$SEMANTIC_VERSION_REGEX\/$URL_PATH_SUFFIX"
URL_REPLACEMENT="$URL_BASE_PATH\/$VERSION_NAME\/$XCFRAMEWORK_ZIP_NAME"
replaceStringInFile 'Package.swift' "$URL_SOURCE" "$URL_REPLACEMENT" 'download-url'

# 4. calculate checksum for .xcframework.zip
XCFRAMEWORK_ZIP_CHECKSUM="$(swift package compute-checksum $XCFRAMEWORK_ZIP_NAME)"
if [[ "$XCFRAMEWORK_ZIP_CHECKSUM" =~ ^[0-9a-z]{64}\$ ]]; then
    echo "XCFRAMEWORK_ZIP_CHECKSUM is: $XCFRAMEWORK_ZIP_CHECKSUM"
else
    echo "Failed computing XCFRAMEWORK_ZIP_CHECKSUM" 2>&1
    exit 1
fi

# 5. Package.swift: update checksum
CHECKSUM_SOURCE='checksum: "[a-z0-9]{64}"'
CHECKSUM_REPLACEMENT="checksum: \"$XCFRAMEWORK_ZIP_CHECKSUM\""
replaceStringInFile 'Package.swift' "$CHECKSUM_SOURCE" "$CHECKSUM_REPLACEMENT" 'download-file-checksum'

# 6. podspec: update version
PODSPEC_VERSION_SOURCE="s.version                   = '$SEMANTIC_VERSION_REGEX'"
PODSPEC_VERSION_REPLACEMENT="s.version                   = '$VERSION_NAME'"
replaceStringInFile 'HybridlocSDK.podspec' "$PODSPEC_VERSION_SOURCE" "$PODSPEC_VERSION_REPLACEMENT" 'version'

# 7. Podspec: update checksum
PODSPEC_CHECKSUM_SOURCE="sha256 => '[a-z0-9]{64}'"
PODSPEC_CHECKSUM_REPLACEMENT="sha256 => '$XCFRAMEWORK_ZIP_CHECKSUM'"
replaceStringInFile 'HybridlocSDK.podspec' "$PODSPEC_CHECKSUM_SOURCE" "$PODSPEC_CHECKSUM_REPLACEMENT" 'download-file-checksum'
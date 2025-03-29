//
//  ReadMePreviewContent.md
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

# PreviewContent

This folder contains content (e.g., SwiftUI previews, mock data, etc.) that is **only** used during development and testing. We have configured our Xcode project so that **none** of the files in this folder are included in the final **Release** build.

## How It Works

- In **Xcode** → **Project** → **Build Settings**, we have added a **User-Defined Setting** named `EXCLUDED_SOURCE_FILE_NAMES`.
- For the **Release** configuration, we set this value to:


- This tells Xcode to **exclude** every file in the `PreviewContent` folder from the Release build.
- For the **Debug** configuration, we leave `EXCLUDED_SOURCE_FILE_NAMES` empty, so the files in `PreviewContent` **are** included in Debug builds and remain available for previews or testing.

## Why Exclude PreviewContent?

- **Faster Production Builds**: Files and resources used only for development (such as SwiftUI previews) do not need to be compiled or bundled in the production app.
- **Smaller Binary Size**: Excluding non-essential files reduces the final app size for end users.
- **Security / Privacy**: Sometimes mock data or development assets should not be shipped to production.

If you need to modify this behavior, open the **Build Settings** for the project’s main **target** and adjust the `EXCLUDED_SOURCE_FILE_NAMES` setting accordingly.

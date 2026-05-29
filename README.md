# Reward Unlock Screen

A single-screen Flutter showcase built around a polished entry animation — wallet drop, brand reveal, staggered card lifts, a confetti celebration, and an auto-scrolling marquee — all driven by **one** intro controller for a coherent feel.

## What's in here

- **Hero entry** — wallet image drops in, the brand wordmark resolves, then the whole stack docks upward to make room for content.
- **Feature cards** — three highlight cards reveal with a tight stagger.
- **Action row** — "Add Money" pill button and "Claim Gift Card" row fade up together.
- **Confetti** — a hand-authored Lottie (`assets/lottie/celebration.json`, 38 layers, 3.5 s) plays once at scene start: two corner poppers → a horizontal top fan → falling paper strips. Colors come from the theme's `confettiPalette`.
- **Marquee** — single looped row of footer text.

No third-party packages beyond `lottie` and `cupertino_icons`. All timings live in [lib/src/core/constants/app_durations.dart](lib/src/core/constants/app_durations.dart) so the choreography stays editable in one place.

## Structure

```
lib/
├── main.dart
└── src/
    ├── core/                       # app-wide concerns
    │   ├── constants/              # durations, intervals, asset paths
    │   ├── extensions/             # context/navigation helpers
    │   └── theme/                  # palette, typography, theme data
    ├── presentation/               # shared, feature-agnostic UI
    │   ├── atoms/                  # CircleIconButton, PillButton
    │   └── molecules/              # FeatureHighlightCard
    └── features/
        └── blinkit_money/
            ├── data/               # static content
            ├── domain/entities/    # plain data classes
            └── presentation/
                ├── screens/        # BlinkitMoneyScreen
                └── widgets/        # WalletHero, ConfettiOverlay, etc.
```

The split is `core` (cross-cutting) → `presentation` (shared atoms/molecules) → `features/<name>/{data,domain,presentation}`. Each feature is self-contained; nothing inside `features/` is imported elsewhere.

## Animations

A single `AnimationController` (4.6 s) drives every reveal via `Interval` curves. The Lottie confetti is the only animation that runs independently, triggered ~850 ms after scene start. See [app_durations.dart](lib/src/core/constants/app_durations.dart) for the full timeline.

## Run

```bash
flutter pub get
flutter run
```

Tested on Flutter 3.x. No platform-specific configuration required beyond the default Android/iOS scaffolding.

## Release

A signed APK and a screen-recording of the build are attached to the GitHub release:

[github.com/shivmanish/payment-success-ui-animation/releases/tag/release](https://github.com/shivmanish/payment-success-ui-animation/releases/tag/release)

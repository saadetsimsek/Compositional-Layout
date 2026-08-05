# Compositional Layout

*One collection view rendering several different section layouts, driven by a data model.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-17.5%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Architecture](https://img.shields.io/badge/pattern-compositional%20layout-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

A discovery screen with a horizontally scrolling stories row, a popular grid and a coming soon
carousel. Before `UICollectionViewCompositionalLayout` this needed either three collection views or a
custom layout subclass. Here it is one collection view whose layout is chosen per section.

## How a section is described

```mermaid
flowchart TD
    DATA["MockData<br/>pageData: [ListSection]"] --> SEC["ListSection<br/>stories | popular | comingSoon"]
    SEC --> LAYOUT["createLayout()<br/>switch on section index"]
    LAYOUT --> L1["stories<br/>small square items<br/>horizontal scrolling group"]
    LAYOUT --> L2["popular<br/>wide items<br/>continuous group"]
    LAYOUT --> L3["comingSoon<br/>full width items<br/>vertical group"]
    L1 --> CELL1["StoriesCollectionViewCell"]
    L2 --> CELL2["PopularCollectionViewCell"]
    L3 --> CELL3["ComingSoonCollectionViewCell"]
    LAYOUT --> HEAD["HeaderSupplementaryView<br/>boundarySupplementaryItems"]
```

Each branch builds an `NSCollectionLayoutItem`, wraps it in a group with its own size and scrolling
behaviour, and returns a section. The data model decides which branch runs, so adding a fourth
section means adding a case, not restructuring the screen.

## Implementation notes

- **Item, group, section.** The three nesting levels are what make the API expressive. An item is one
  cell, a group arranges items, a section arranges groups and owns the scroll behaviour.
- **Fractional and absolute sizing together.** Widths are expressed as a fraction of the container
  while heights are absolute, which is what keeps the layout correct across device sizes.
- **Headers as boundary items.** `HeaderSupplementaryView` is attached to the section rather than
  faked with a first cell, so it pins and scrolls the way a header should.
- **The model drives the layout.** `ListSection` and `ListItem` are plain types with no UIKit
  knowledge, so the same data could feed a different presentation.

## Project structure

```
CompositionalLayout/
├── Models/         ListSection, ListItem, MockData
├── Cells/          StoriesCollectionViewCell, PopularCollectionViewCell,
│                   ComingSoonCollectionViewCell, HeaderSupplementaryView
└── ViewController/ layout construction and data source
```

## Requirements

Xcode 15 or later, iOS 17.5 or later. No external dependencies.

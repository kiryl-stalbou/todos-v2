# todos

##  Build app
prebuild: /bin/zsh /Users/user/Projects/intesys/y-mobile-todo-flutter/pre_build_script.sh

## 1. GitFlow
Branches: master, dev, feature/name-1, bugfix/name-2.
Commit name structure: [name-1] Description
Merge request should contain no more than 40 files

## 2. Architecture
Clean Architecture + RiverPod
Dependency Injection: RiverPod
Domain layer: models, repositories, use-cases.
Data layer: entities, mappers from entities to domain model, implementations of repositories and providers.
Presentation layer: screens + riverPod

## 3. Project structure
Modules: core, core_ui, navigation, data, domain, etc.
For presentation layer every feature is a separate module.

## 4. Code Development Rules
Lint rules described in analysis_options.yaml

## 5. Asynchrony support
Flutter Async

## 6. Abstractions for data sources and data access
Providers are responsible for specific services (e.g. http provider, local provider, etc.),
they use data layer entities. Do not have abstract base classes.
Repositories are responsible for gathering data from providers
and mapping it to the corresponding domain layer models. Have abstract base classes in domain layer.

## 8. Presentation layer abstractions
Base and frequently used widgets are stored in core_ui module.
Base widget for screens is AppScaffold.
Example: CustomScreen -> CustomContent
Navigation is implemented using Go Router
Navigation on RiverPod event is done from the RiverPodNotifier object itself 
without BuildContext.

## 9. Logging
No logging

## 10. App distributing
The application is deployed automatically using hooks on the master branch


## 11. Approach for working with UI
One file = one widget.
Screen widget contains RiverPodProvider.

## 12. Localization
Localization is implemented using EasyLocalization service.

## 13. Design system
Fonts, colors, frequently used constant values, and icons are stored in core_ui module.

## 14. Supported platforms
iOS and Android platforms

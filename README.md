# Baraka Stocks app
this project consumes https://raw.githubusercontent.com/dsancov/TestData/main/stocks.csv for stock tickers, and https://saurav.tech/NewsAPI/everything/cnn.json for news feed

## Technologies used
- I've used MVVM design pattern with Repository pattern,
- for UI part I've used collection View with `UICollectionViewCompositionalLayout` for layout manager, and `UICollectionViewDiffableDataSource` for Data Source managing
- for reactivity I've used `Combine` to handle data streams
  - `AnyPublisher` that allow to create a publisher that don't accept `send` action
  - `CurrentValueSubject` that will emit value and keep it for any new subscribers
  - `Timer.publish` that allow to emit and trigger an action every time interval

## Libraries used
 I've only used SwiftCSV to handle CSV reading and parsing, and I've used `SPM` to install the package
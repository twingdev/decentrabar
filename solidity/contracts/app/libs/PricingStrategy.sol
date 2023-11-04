// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

abstract contract PricingStrategy {


    string strategyDescription;

    uint256 internal _price;

    struct PriceHistory {
        uint256 time;
        uint256 blockNumber;
        uint256 price;
    }

    mapping(uint256 => PriceHistory) internal _history;
    uint256 public numPriceHistoryRecords;
    uint256[] internal _priceHistoryRecords;
    uint256 internal index;

    function setStrategy(string memory name_, uint256 price_) internal {

        _price = price_; // initial price
        index = 1;
        _history[index] = PriceHistory(block.timestamp, block.number, _price);
        numPriceHistoryRecords = 1;
        _priceHistoryRecords.push(index);

    }

    function _setDescription(string memory desc) internal {
        strategyDescription = desc;
    }

    function _updatePrice(uint256 oldPrice, uint256 newPrice) internal {
        require(_price == oldPrice, "price is the same");
        index += 1;
        _history[index] = PriceHistory(block.timestamp, block.number, _price);
        numPriceHistoryRecords = 1;
        _priceHistoryRecords.push(index);

    }

    function _applyStrategy() internal virtual returns(uint256 newPrice) {
        newPrice = _price;
    }

    function _lastPrice() internal view returns(uint256 lastPrice) {
        lastPrice = _history[index-1].price;
    }

}
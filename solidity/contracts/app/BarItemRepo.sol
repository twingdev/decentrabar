// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "./interfaces/items.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/access/manager/AccessManaged.sol";
import "./libs/PricingStrategy.sol";

contract BarItemsRepo is ItemInterface, ERC1155, ERC1155Burnable, ERC1155Supply, ERC1155URIStorage, AccessManaged, PricingStrategy {

        string public name;
        string public version;
        mapping(uint256 => address) public creators;
        mapping(uint256 => mapping(string => string)) private _metas;
        mapping(uint256 => PricingStrategy) public pricingStrategy;

    constructor(string memory __uri, string memory __version) ERC1155(__uri) AccessManaged(msg.sender) {
        name = "Decentrabar items repository";
        version = __version;
    }

    function mint(address _to, uint256 tokenId, uint256 value, bytes calldata data) public restricted {

        return super.safeTransferFrom(msg.sender, _to, tokenId, value, data);
    }

    function UnitPrice() external pure returns(uint256) {
        return 0;
    }

    function GiveTo(address to, uint256 item_id, uint256 qty) external pure returns(bool success) {
        success = false;
    }

    function SellTo(address to, uint256 item_id, uint256 qty, uint256 price) external pure returns(bool success) {
    success = false;
}

    function GetItem(uint256 item_id) external view returns(string memory uri_) {
        uri_ = uri(item_id);
    }

    function Meta(uint256 item_id, string memory key) external view returns(string memory value) {
        return _metas[item_id][key];
    }

    function Creator(uint256 item_id) external view returns(address creator) {
        return creators[item_id];
    }

    function Flags() external pure returns(string[] memory flags) {
        string[] memory _flags;
        flags = _flags;
    }

    function uri(uint256 tokenId) public view virtual override(ERC1155,ERC1155URIStorage) returns (string memory) {
        return super.uri(tokenId);
    }

    function _update(address from, address to, uint256[] memory ids, uint256[] memory values) internal override(ERC1155,ERC1155Supply) {
        return super._update(from, to, ids, values);
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

interface ItemInterface is IERC1155 {




    event ItemGiven(address indexed from, address indexed to, address item, uint256 itemId, uint256 qty);
    event ItemSold(address indexed buyer, address indexed seller, uint256 itemId, uint256 qty, uint256 unitPrice);
    event ItemCreated(address indexed creator, string name, uint256 tokenId);

    function UnitPrice() external returns(uint256);

    function GiveTo(address to, uint256 item_id, uint256 qty) external returns(bool success);

    function SellTo(address to, uint256 item_id, uint256 qty, uint256 price) external returns(bool success);

    function GetItem(uint256 item_id) external returns(string memory uri_);

    function Meta(uint256 item_id, string memory key) external view returns(string memory value);

    function Creator(uint256 item_id) external view returns(address creator);

    function Flags() external view returns(string[] memory flags);



}
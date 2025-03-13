//SPDX-license-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PicaToken is ERC20 {

    constructor(uint256 initalSupply) ERC20("PicaToken", "PCT") {
        _mint(msg.sender, initalSupply);
    }

}
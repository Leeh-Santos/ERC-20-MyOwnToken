//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {PicaToken} from "../src/PicaToken.sol";

contract DeployPica is Script {
  
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(PicaToken) {
       vm.startBroadcast();
       PicaToken pc =  new PicaToken(INITIAL_SUPPLY);
       vm.stopBroadcast();
        return pc;
    }
}
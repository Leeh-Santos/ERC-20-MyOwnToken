//SPDX-license-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployPica} from "../script/DeployPica.s.sol";
import {PicaToken} from "../src/PicaToken.sol";



contract PicaTokenTest is Test{

    PicaToken public picaToken;
    DeployPica public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployPica();
        picaToken = deployer.run();

        vm.prank(msg.sender);

        picaToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(picaToken.balanceOf(bob), STARTING_BALANCE);
    }
}
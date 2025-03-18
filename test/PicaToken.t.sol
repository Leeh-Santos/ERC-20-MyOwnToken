//SPDX-license-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployPica} from "../script/DeployPica.s.sol";
import {PicaToken} from "../src/PicaToken.sol";



contract PicaTokenTest is Test{

    PicaToken public picaToken;
    DeployPica public deployer;

    address bob = makeAddr("bobmarlley");
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

    function testAllowense() public {
        uint256 initalAllowance = 1000;

        //bob approves alice to spend on her behalf 
        vm.prank(bob);
        picaToken.approve(alice, initalAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        picaToken.transferFrom(bob, alice, transferAmount);

        assertEq(picaToken.balanceOf(alice), transferAmount);
        assertEq(picaToken.balanceOf(bob), STARTING_BALANCE - transferAmount);

    }


}
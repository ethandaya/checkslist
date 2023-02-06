// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Strings} from "openzeppelin-contracts/utils/Strings.sol";
import {ChecklistRenderer} from "../src/ChecklistRenderer.sol";
import { ERC721AMock } from "erc721a/mocks/ERC721AMock.sol";

contract ChecklistRendererTest is Test {
    ERC721AMock tokenContract;
    ChecklistRenderer renderer;

    function setUp() public {
        renderer = new ChecklistRenderer(
            "Checklist",
            "descr",
            "image://",
            Strings.toString(250),
            string(abi.encodePacked(msg.sender)),
            "checklist.wtf",
            payable(address(123))
        );
    }

    function test_buildSVG() public {
        string memory svg = renderer.buildSVG(address(0), 20);
        assertEq(vm.readFile('./test/__snapshots__/test_buildSVG.txt'), svg);
    }


}

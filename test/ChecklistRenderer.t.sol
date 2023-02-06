// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/ChecklistRenderer.sol";

contract ChecklistRendererTest is Test {
    InfiniteCheckRenderer renderer;

    function setUp() public {
        renderer = new InfiniteCheckRenderer();
    }

    function test_buildSVG() public {
        string memory svg = renderer.buildSVG();
        vm.writeFile("./test.html", string(abi.encodePacked("<img src=", svg, " />")));
    }


}

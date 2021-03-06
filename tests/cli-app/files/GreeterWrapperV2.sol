pragma solidity ^0.4.24;

import "mock-stdlib/contracts/Greeter.sol";
import "mock-stdlib/contracts/SharedLibrary.sol";

contract GreeterWrapper {
  using SharedNumbers for uint256;
  Greeter public greeter;

  function initialize(Greeter _greeter) public {
    require(_greeter != address(0));
    greeter = _greeter;
  }

  function say() public view returns (string) {
    return greeter.who();
  }

  function iteration() public view returns (uint256) {
    return greeter.minor().triple() + 10;
  }
}
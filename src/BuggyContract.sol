// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BuggyContract {
    uint private count = 0;
    string messages;
    bool public isPaused;
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // Bug 1
    function aSender() private {
        owner = msg.sender;
    }

    // Bug 2
    function increment(uint amount) public {
        count += amount;
    }

    // Bug 3
    function getCount() public view returns (uint) {
        return count;
    }

    // Bug 4
    function divideCount(uint divisor) public view returns (uint sum) {
        require (divisor != 0);
        sum = count / divisor;
        return sum;
    }

    // Bug 5
    // Hint: make sure that message is only stored temporarily
    function setMessage(string memory message) public {
        messages = message;
    }

    // Bug 6
    // Hint: two things to do here.
    // Think about how to make the loop more efficient
    // and read the compiler
    function sumNumbers(uint n) public pure returns (uint sum) {
        for (uint i; i <= n; i++) {
            sum += i;
        }
        return sum;
    }

    // Bug 7
    // Hint: Think about math operation overflow
    function setCountWithMultiplication(uint x, uint y) public {
        require(x == 0 || y <= type(uint).max / x);
        count = x * y;
    }

    // Bug 8
    function resetCount() public onlyOwner {
        count = 0;
    }

    // Bug 9
    function togglePause() public view onlyOwner {
        isPaused != isPaused;
    }
}

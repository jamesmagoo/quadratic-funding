// SPDX-License-Identifier: MIT

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions
pragma solidity ^0.8.18;

/**
 * @title WTF is Quadratic Funding
 * @author jamesmagoo
 * @notice Learning exercise on how to implement quadratic funding
 * @dev not sure yet
 */
contract MainQuadraticFund {
    error MainQuadraticFund__NotAuthorized();
    error MainQuadraticFund__EntranceFeeRequired();
    error MainQuadraticFund__ProjectNotInFund();
    error MainQuadraticFund__TimeNotUp();
    error MainQuadraticFund__OnlyOneContributionPerProject();
    // Store the main fund a.k.a matching pool this will be the address.balance of this contract..
    // Allow projects to submit to the fund for donations
    // Allow users to donate to these projects
    // Calculate the distribution of the matching pool to the project at X time.
    // need to set some kind of time limit

    // State variables
    address public immutable i_owner;
    uint256 private immutable i_projectEntranceFee;
    mapping(address => bool) private s_projects;
    mapping(address project => uint256 noOfContributors) public projectContributions;
    mapping(address contributor => address project) public contributorProject;

    // TODO would it be worthwhile keeping track of how much eahc project got from donations? key is no. of donations in terms of quadratic funding calculation..
    // Events
    // Modifiers

    // FUNCTIONS// Layout of Functions:
    constructor() {
        i_owner = msg.sender;
    }
    // receive function (if exists)
    // fallback function (if exists)
    // external
    // public

    function applyForFunding() public payable {
        if (msg.value < i_projectEntranceFee) {
            revert MainQuadraticFund__EntranceFeeRequired();
        }
        s_projects[payable(msg.sender)] == true;
    }

    function donateToProject(address project) public payable {
        if (s_projects[project] != true) {
            revert MainQuadraticFund__ProjectNotInFund();
        }
        if (contributorProject[msg.sender] == project) {
            revert MainQuadraticFund__OnlyOneContributionPerProject();
        }
        // TODO transfer funds to the project...
        projectContributions[project] += 1;
        contributorProject[msg.sender] == project;
    }
    // internal
    // private

    function calculateMatchingPoolPortion() private pure {}

    function timer() private pure {}

    function addToMatchingPool() public {}

    // view & pure functions
    function isProjectInFund(address proj) public view returns (bool) {
        return s_projects[proj];
    }

    function getOwner() public view returns (address) {
        return i_owner;
    }

    function getNumberOfContributors(address proj)public view returns(uint){
        return projectContributions[proj]; 
    }
}

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

error MainQuadraticFund__NotAuthorized();
error MainQuadraticFund__TimeNotUp();
error MainQuadraticFund__OnlyOneContributionPerProject();

/**
 * @title WTF is Quadratic Funding
 * @author jamesmagoo
 * @notice Learning exercise on how to implement quadratic funding
 * @dev not sure yet
 */
contract MainQuadraticFund {
    // Store the main fund a.k.a matching pool this will be the address.balance of this contract..
    // Allow projects to submit to the fund for donations
    // Allow users to donate to these projects
    // Calculate the distribution of the matching pool to the project at X time.
    // need to set some kind of time limit

    // Type declarations
    struct Contribution {
        string nameOfContributor;
        uint256 amountContributed;
        address projectSupported;
    }
    // State variables

    uint256 public thePot;
    // each project can be an eth address for now
    address payable[] private s_projects;
    Contribution[] public contributions;

    mapping(address project => uint256 noOfContributors) public projectContributions;
    mapping(address contributor => address project) public contributorProject;

    // Events
    // Modifiers

    // FUNCTIONS// Layout of Functions:
    // constructor
    // receive function (if exists)
    // fallback function (if exists)
    // external
    // public
    // internal
    // private
    // view & pure functions
    function makeContribution(string memory _name, uint256 _amount, address _projectSupported) public {
        // check if contrubutor has already contributed, can only contribute once
        contributions.push(Contribution(_name, _amount, _projectSupported));
    }
}

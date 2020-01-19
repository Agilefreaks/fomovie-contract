pragma solidity ^0.5.0;

import "@openzeppelin/contracts-ethereum-package/contracts/ownership/Ownable.sol";

interface DaiToken {
    function transfer(address dst, uint wad) external returns (bool);
    function transferFrom(address src, address dst, uint wad) external returns (bool);
    function balanceOf(address guy) external view returns (uint);
}

contract MovieLicense is Ownable {
    address daiTokenAddress = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    DaiToken daiToken = DaiToken(daiTokenAddress);
    mapping(address => uint256) public funds;
    uint256 public totalFunded;
    uint256 public licenseCost;
    string public movieTitle;
    uint256 public deadline;


    event FundingComplete(string movieTitle);
    event FundingReceived(string movieTitle, uint256 totalFunded, uint256 licenseCost);

    modifier incomplete() {
        require(totalFunded < licenseCost, "Funding is already complete");
        _;
    }

    modifier active() {
        require(now <= deadline, "Funding is expired. I'm sure you can find a different movie.");
        _;
    }

    modifier expired() {
        require(now > deadline, "Funding is ongoing. You cannot withdraw your fund yet.");
        _;
    }
    modifier notTooMuch(uint256 daiAmount) {
        require(licenseCost-totalFunded >= daiAmount, "You are sending too much. You can donate the rest here: (marek's Address)");
        _;
    }

    constructor(string memory _movieTitle, uint256 _licenseCost) public {
        movieTitle = _movieTitle;
        licenseCost = _licenseCost;
        deadline = now + 30 days; //this can be set through a param by the issuer
    }

    function fund(uint256 daiAmount) public incomplete notTooMuch(daiAmount) returns(bool) {
        require(daiToken.transferFrom(msg.sender, address(this), daiAmount), "Funding transaction failed");
        totalFunded = totalFunded + daiAmount;
        funds[msg.sender] = funds[msg.sender] + daiAmount;

        if (totalFunded >= licenseCost) {
            emit FundingComplete(movieTitle);
        } else {
            emit FundingReceived(movieTitle, totalFunded, licenseCost);
        }
    }

    function withdraw() public expired {
        daiToken.transferFrom(address(this), msg.sender, funds[msg.sender]);
    }
}


// Create this from the DAP
// Looks like an escrow contract
// contract MovieLicense {    
//     string public movieShortName;
//     uint256 public licesingCostInDai;
//     uint256 public price;
//     // interstelar, 100
//     constructor(string movieShortName, uint256 licesingCostInDai) public;
//     event fundingReceived
//     event fundingComplete
//     event licensePurchased
//     // msg.sender, 30
//     function fund(uint256 dai) public payable {
//         // 0.3
//         // store sender, 0.3
//         // check if completed / in progress
//     }
//     // check license
//     // cancel refund transactions
//     // payout msg.sender with licesingCostInDai
//     function provideLicence(address license) {
//         // send event licensePurchased
//     }

//     function progress() view returns (uint256) {
//         // returns a number between 0 - 100
//     }

//     function distribute(uint256 amount) {
//         // get all addresses and tokens and distribute DAI about based on that
//     }

//     function setPrice(uint32 amountInDai) {
//         // check if owner (one of the addresses that called fund)
//     }
//     // onComplete scheduled transaction to refund
//     // onLicensedPurchased send license_share_erc20_token to all license funders
// }
// // license = new MovieLicense('Interstalar', 100)
// depixx.addLicense(license)
// depix.createLicense('Interstelar', 100)
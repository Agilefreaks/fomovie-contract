pragma solidity ^0.5.0;

import "@openzeppelin/contracts-ethereum-package/contracts/ownership/Ownable.sol";

contract MovieLicense {
    constructor(string memory movieTitle, uint256 licenseCost) public {

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
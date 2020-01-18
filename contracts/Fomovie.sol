pragma solidity ^0.5.0;

import "@openzeppelin/contracts-ethereum-package/contracts/ownership/Ownable.sol";
import "./MovieLicense.sol";

contract Fomovie is Ownable {
    address[] public movieLicenses;
    mapping(string => address) public licenses;

    event FundingStarted(address movieLicenseAddress, uint256 licenseCost);

    // anybody can call this function?
    function startFunding(string memory movieTitle, uint256 licenseCost) public returns (address) {
        MovieLicense movieLicense = new MovieLicense(movieTitle, licenseCost);
        address movieLicenseAddress = address(movieLicense);
        movieLicenses.push(movieLicenseAddress);
        licenses[movieTitle] = movieLicenseAddress;

        emit FundingStarted(movieLicenseAddress, licenseCost);

        return movieLicenseAddress;
    }

    function getLicenseByMovieTitle(string memory movieTitle) public view returns(address) {
        return licenses[movieTitle];
    }

    function getLicenseCount() public view returns(uint256) {
        return movieLicenses.length;
    }
}



// contract Depixxx {
//     address[] public licenses;
//     function startFunding(string movieShortName, uint256 licesingCostInDai) returns (address) {
//         // new MovieLicense()
//         // add to licenses
//     }

//     function watch(address movieLicense, uint256 costInDai) payable returns (drmPlaylist) {
//         // check if movieLicense is complete
//         // check if costInDay is == movieLicense.price
//         amount = costInDai - platformFee;
//         movieLicense.distribute(amount);
//     }
// }

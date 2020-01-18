const { accounts, contract } = require('@openzeppelin/test-environment');
const { expect } = require('chai');

// Import utilities from Test Helpers
const { BN, expectEvent } = require('@openzeppelin/test-helpers');

const Fomovie = contract.fromArtifact('Fomovie');

describe('Fomovie', function () {
  const [ owner, other ] = accounts;

  beforeEach(async function () {
    this.contract = await Fomovie.new({ from: owner });
      await this.contract.initialize(owner);
    });

  describe('#getLicenceCount', function() {
    it('is empty', async function() {
      expect(await this.contract.getLicenseCount()).to.be.bignumber.equal(new BN('0'));
    });

    it('is not empty after a successfull call to startFunding', async function (){
      await this.contract.startFunding("Interstellar", 10000);

      expect(await this.contract.getLicenseCount()).to.be.bignumber.equal(new BN('1'));
    });
  });

  describe('#startFunding', function() {
    it('adds the new contract address to licenses', async function() {
      const result = await this.contract.startFunding("Interstellar", 10000);

      expect(await this.contract.getLicenseByMovieTitle('Interstellar')).to.equal(result.receipt.logs[0].args['0']);
    });

    it('emits a FundingStarted event', async function() {
      const result = await this.contract.startFunding("Interstellar", 10000);

      expectEvent(result, 'FundingStarted', { movieLicenseAddress: result.receipt.logs[0].args['0'], licenseCost: '10000'});
    });
  });
});
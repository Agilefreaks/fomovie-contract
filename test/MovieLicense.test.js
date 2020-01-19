const { accounts, contract } = require('@openzeppelin/test-environment');
const { expect } = require('chai');

// Import utilities from Test Helpers
const { BN, expectEvent, expectRevert, time } = require('@openzeppelin/test-helpers');

const MovieLicense = contract.fromArtifact('MovieLicense');

describe('MovieLicense', function () {
    const [ owner, other ] = accounts;
    
    beforeEach(async function () {
        this.contract = await MovieLicense.new('Interstellar', '1000');
    });

    it('works', function () {
        expect(true).to.equal(true);
    });
});
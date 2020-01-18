const { accounts, contract } = require('@openzeppelin/test-environment');
const { expect } = require('chai');

// Import utilities from Test Helpers
const { BN, expectEvent, expectRevert } = require('@openzeppelin/test-helpers');

const MovieLicense = contract.fromArtifact('MovieLicense');

describe('MovieLicense', function () {
    it('works', function () {
        expect(true).to.equal(true);
      });
});
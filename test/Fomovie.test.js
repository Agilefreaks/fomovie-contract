const { accounts, contract } = require('@openzeppelin/test-environment');
const { expect } = require('chai');

// Import utilities from Test Helpers
const { BN, expectEvent, expectRevert } = require('@openzeppelin/test-helpers');

const Fomovie = contract.fromArtifact('Fomovie');

describe('Fomovie', function () {
    it('works', function () {
        expect(true).to.equal(true);
      });
});
// Sources flattened with hardhat v2.7.0 https://hardhat.org

// File contracts/tokens/interfaces/IZKUSD.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IZKUSD {
    function addVault(address _vault) external;
    function removeVault(address _vault) external;
    function mint(address _account, uint256 _amount) external;
    function burn(address _account, uint256 _amount) external;
}


// File contracts/libraries/Constants.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
library Constants {
    /* BASE */
    string public constant ZKDX_ID = "ZKDX";
    string public constant ZKDX_TOKEN_NAME = "ZKDX";
    string public constant ZKDX_TOKEN_SYMBOL = "ZKDX";
    string public constant ZKDLP_ID = "ZKDLP";
    string public constant ZKDLP_TOKEN_NAME = "ZKDLP";
    string public constant ZKDLP_TOKEN_SYMBOL = "ZKDLP";

    string public constant ZKUSD_TOKEN_NAME = "ZKUSD";
    string public constant ZKUSD_TOKEN_SYMBOL = "ZKUSD";
    /* VaultPriceFeed.sol */
    uint256 public constant PRICE_PRECISION = 10 ** 30;
    uint256 public constant ONE_USD = PRICE_PRECISION;
    uint256 public constant BASIS_POINTS_DIVISOR = 10000;
    uint256 public constant MAX_SPREAD_BASIS_POINTS = 50;
    uint256 public constant MAX_ADJUSTMENT_INTERVAL = 2 hours;
    uint256 public constant MAX_ADJUSTMENT_BASIS_POINTS = 20;
    address constant internal FLAG_ARBITRUM_SEQ_OFFLINE = address(bytes20(bytes32(uint256(keccak256("chainlink.flags.arbitrum-seq-offline")) - 1)));
    /* VaultUtils.sol */
    uint256 public constant FUNDING_RATE_PRECISION = 1000000;

    /* Vault.sol*/
    uint256 public constant MIN_LEVERAGE = 10000; // 1x
    uint256 public constant ZKUSD_DECIMALS = 18;
    uint256 public constant MAX_FEE_BASIS_POINTS = 500; // 5%
    uint256 public constant MAX_LIQUIDATION_FEE_USD = 100 * PRICE_PRECISION; // 100 USD
    uint256 public constant MIN_FUNDING_RATE_INTERVAL = 1 hours;
    uint256 public constant MAX_FUNDING_RATE_FACTOR = 10000; // 1%

    /* OrderBook.sol */
    uint256 public constant ZKUSD_PRECISION = 1e18;

    /* ZKDLP.sol */
    uint256 public constant ZKDLP_PRECISION = 10 ** 18;
    uint256 public constant MAX_COOLDOWN_DURATION = 48 hours;

    /* ShortsTracker */
    uint256 public constant MAX_INT256 = uint256(type(int256).max);
}


// File contracts/libraries/Errors.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
library Errors {
    /* Timelock Error Message*/
    string public constant Timelock_Invalid_Target = "Timelock: invalid _target";
    string public constant Timelock_Invalid_Buffer = "Timelock: invalid _buffer";
    string public constant Timelock_Buffer_Cannot_Be_Decreased = "Timelock: buffer cannot be decreased";
    string public constant Timelock_invalid_maxLeverage = "Timelock: invalid _maxLeverage";
    string public constant Timelock_invalid_fundingRateFactor = "Timelock: invalid _fundingRateFactor";
    string public constant Timelock_invalid_stableFundingRateFactor = "Timelock: invalid _stableFundingRateFactor";
    string public constant Timelock_invalid_minProfitBps = "Timelock: invalid _minProfitBps";
    string public constant Timelock_token_not_yet_whitelisted = "Timelock: token not yet whitelisted";
    string public constant TIMELOCK_INVALID_MAXGASPRICE = "Invalid _maxGasPrice";
    string public constant TIMELOCK_INVALID_LENGTHS = "Timelock: invalid lengths";
    string public constant TIMELOCK_MAXTOKENSUPPLY_EXCEEDED = "Timelock: maxTokenSupply exceeded";
    string public constant TIMELOCK_ACTION_ALREADY_SIGNALLED = "Timelock: action already signalled";
    string public constant TIMELOCK_ACTION_NOT_SIGNALLED = "Timelock: action not signalled";
    string public constant TIMELOCK_ACTION_TIME_NOT_YET_PASSED = "Timelock: action time not yet passed";
    string public constant TIMELOCK_INVALID_ACTION = "Timelock: invalid _action";
    string public constant TIMELOCK_INVALID_BUFFER = "Timelock: invalid _buffer";
    /* PriceFeed Error Message*/
    string public constant PriceFeed_forbidden = "PriceFeed: forbidden";
    /* ZKUSD.sol*/
    string public constant ZKUSD_FORBIDDEN = "ZKUSD: forbidden";
    /* BasePositionManagers.sol */
    string public constant BASEPOSITIONMANAGER_MARK_PRICE_LOWER_THAN_LIMIT      = "BasePositionManager: mark price lower than limit";
    string public constant BASEPOSITIONMANAGER_MARK_PRICE_HIGHER_THAN_LIMIT     = "BasePositionManager: mark price higher than limit";
    string public constant BASEPOSITIONMANAGER_INVALID_PATH_LENGTH              = "BasePositionManager: invalid _path.length";
    string public constant BASEPOSITIONMANAGER_INSUFFICIENT_AMOUNTOUT           = "BasePositionManager: insufficient amountOut";
    string public constant BASEPOSITIONMANAGER_MAX_GLOBAL_LONGS_EXCEEDED        = "BasePositionManager: max global longs exceeded";
    string public constant BASEPOSITIONMANAGER_MAX_GLOBAL_SHORTS_EXCEEDED       = "BasePositionManager: max global shorts exceeded";
    string public constant BASEPOSITIONMANAGER_INVALID_SENDER                   = "BasePositionManager: invalid sender";
    /* PositionManager.sol */
    string public constant POSITIONMANAGER_INVALID_PATH_LENGTH                  = "PositionManager: invalid _path.length";
    string public constant POSITIONMANAGER_INVALID_PATH                         = "PositionManager: invalid _path";
    string public constant POSITIONMANAGER_LONG_DEPOSIT                         = "PositionManager: long deposit";
    string public constant POSITIONMANAGER_LONG_LEVERAGE_DECREASE               = "PositionManager: long leverage decrease";
    string public constant POSITIONMANAGER_FORBIDDEN                            = "PositionManager: forbidden";
    /* Router.sol*/
    string public constant ROUTER_FORBIDDEN                                     = "Router: forbidden";
    /* ZkdlpManager.sol */
    string public constant ZKDLPMANAGER_ACTION_NOT_ENABLED                      = "ZkdlpManager: action not enabled";
    string public constant ZKDLPMANAGER_INVALID_WEIGHT                          = "ZkdlpManager: invalid weight";
    string public constant ZKDLPMANAGER_INVALID_COOLDOWNDURATION                = "ZkdlpManager: invalid _cooldownDuration";
    string public constant ZKDLPMANAGER_INVALID_AMOUNT                          = "ZkdlpManager: invalid _amount";
    string public constant ZKDLPMANAGER_INSUFFICIENT_ZKUSD_OUTPUT               = "ZkdlpManager: insufficient ZKUSD output";
    string public constant ZKDLPMANAGER_INSUFFICIENT_ZKDLP_OUTPUT               = "ZkdlpManager: insufficient ZKDLP output";
    string public constant ZKDLPMANAGER_INVALID_ZKDLPAMOUNT                     = "ZkdlpManager: invalid _ZKDLPAmount";
    string public constant ZKDLPMANAGER_COOLDOWN_DURATION_NOT_YET_PASSED        = "ZkdlpManager: cooldown duration not yet passed";
    string public constant ZKDLPMANAGER_INSUFFICIENT_OUTPUT                     = "ZkdlpManager: insufficient output";
    string public constant ZKDLPMANAGER_FORBIDDEN                               = "ZkdlpManager: forbidden";
    /* ShortsTrack.sol*/
    string public constant SHORTSTRACKER_FORBIDDEN                              = "ShortsTracker: forbidden";
    string public constant SHORTSTRACKER_INVALID_HANDLER                        = "ShortsTracker: invalid _handler";
    string public constant SHORTSTRACKER_ALREADY_MIGRATED                       = "ShortsTracker: already migrated";
    string public constant SHORTSTRACKER_OVERFLOW                               = "ShortsTracker: overflow";
    /* VaultUtils.sol*/
    string public constant VAULT_LOSSES_EXCEED_COLLATERAL                       = "Vault: losses exceed collateral";
    string public constant VAULT_FEES_EXCEED_COLLATERAL                         = "Vault: fees exceed collateral";
    string public constant VAULT_LIQUIDATION_FEES_EXCEED_COLLATERAL             = "Vault: liquidation fees exceed collateral";
    string public constant VAULT_MAXLEVERAGE_EXCEEDED                           = "Vault: maxLeverage exceeded";
    /* VaultPriceFeed.sol*/
    string public constant VAULTPRICEFEED_FORBIDDEN                             = "VaultPriceFeed: forbidden";
    string public constant VAULTPRICEFEED_ADJUSTMENT_FREQUENCY_EXCEEDED         = "VaultPriceFeed: adjustment frequency exceeded";
    string public constant VAULTPRICEFEED_INVALID_ADJUSTMENTBPS                 = "Vaultpricefeed: invalid _adjustmentBps";
    string public constant VAULTPRICEFEED_INVALID_SPREADBASISPOINTS             = "VaultPriceFeed: invalid _spreadBasisPoints";
    string public constant VAULTPRICEFEED_INVALID_PRICESAMPLESPACE              = "VaultPriceFeed: invalid _priceSampleSpace";
    string internal constant VAULTPRICEFEED_INVALID_PRICE_FEED                  = "VaultPriceFeed: invalid price feed";
    string internal constant VAULTPRICEFEED_INVALID_PRICE                       = "VaultPriceFeed: invalid price";
    string internal constant CHAINLINK_FEEDS_ARE_NOT_BEING_UPDATED              = "Chainlink feeds are not being updated";
    string internal constant VAULTPRICEFEED_COULD_NOT_FETCH_PRICE               = "VaultPriceFeed: could not fetch price";
    /* VaultInternal.sol*/
    string internal constant VAULT_POOLAMOUNT_EXCEEDED                          = "Vault: poolAmount exceeded";
    string internal constant VAULT_INSUFFICIENT_RESERVE                         = "Vault: insufficient reserve";
    string internal constant VAULT_MAX_SHORTS_EXCEEDED                          = "Vault: max shorts exceeded";
    string internal constant VAULT_POOLAMOUNT_BUFFER                            = "Vault: poolAmount < buffer";
    string internal constant VAULT_INVALID_ERRORCONTROLLER                      = "Vault: invalid errorController";
    /* Router.sol */
    string internal constant ROUTER_INVALID_SENDER                              = "Router: invalid sender";
    string internal constant ROUTER_INVALID_PATH                                = "Router: invalid _path";
    string internal constant ROUTER_MARK_PRICE_HIGHER_THAN_LIMIT                = "Router: mark price higher than limit";
    string internal constant ROUTER_MARK_PRICE_LOWER_THAN_LIMIT                 = "Router: mark price lower than limit";
    string internal constant ROUTER_INVALID_PATH_LENGTH                         = "Router: invalid _path.length";
    string internal constant ROUTER_INSUFFICIENT_AMOUNTOUT                      = "Router: insufficient amountOut";
    string internal constant ROUTER_INVALID_PLUGIN                              = "Router: invalid plugin";
    string internal constant ROUTER_PLUGIN_NOT_APPROVED                         = "Router: plugin not approved";
    /* OrderBook.sol*/
    string internal constant ORDERBOOK_FORBIDDEN                                = "OrderBook: forbidden";
    string internal constant ORDERBOOK_ALREADY_INITIALIZED                      = "OrderBook: already initialized";
    string internal constant ORDERBOOK_INVALID_SENDER                           = "OrderBook: invalid sender";
    string internal constant ORDERBOOK_INVALID_PATH_LENGTH                      = "OrderBook: invalid _path.length";
    string internal constant ORDERBOOK_INVALID_PATH                             = "OrderBook: invalid _path";
    string internal constant ORDERBOOK_INVALID_AMOUNTIN                         = "OrderBook: invalid _amountIn";
    string internal constant ORDERBOOK_INSUFFICIENT_EXECUTION_FEE               = "OrderBook: insufficient execution fee";
    string internal constant ORDERBOOK_ONLY_WETH_COULD_BE_WRAPPED               = "OrderBook: only weth could be wrapped";
    string internal constant ORDERBOOK_INCORRECT_VALUE_TRANSFERRED              = "OrderBook: incorrect value transferred";
    string internal constant ORDERBOOK_INCORRECT_EXECUTION_FEE_TRANSFERRED      = "OrderBook: incorrect execution fee transferred";
    string internal constant ORDERBOOK_NON_EXISTENT_ORDER                       = "OrderBook: non-existent order";
    string internal constant ORDERBOOK_INVALID_PRICE_FOR_EXECUTION              = "OrderBook: invalid price for execution";
    string internal constant ORDERBOOK_INSUFFICIENT_COLLATERAL                  = "OrderBook: insufficient collateral";
    string internal constant ORDERBOOK_INSUFFICIENT_AMOUNTOUT                   = "OrderBook: insufficient amountOut";
    /* RewardRouterV2.sol */
    string internal constant REWARDROUTER_INVALID_AMOUNT                        = "RewardRouter: invalid _amount";
    string internal constant REWARDROUTER_INVALID_MSG_VALUE                     = "RewardRouter: invalid msg.value";
    string internal constant REWARDROUTER_ALREADY_INITIALIZED                   = "RewardRouter: already initialized";
    string internal constant REWARDROUTER_INVALID_ZKUSDAMOUNT                   = "RewardRouter: invalid _zkusdAmount";

    /* YieldToken.sol */
    string public constant YIELDTOKEN_ACCOUNT_ALREADY_MARKED                    = "YieldToken: _account already marked";
    string public constant YIELDTOKEN_ACCOUNT_NOT_MARKED                        = "YieldToken: _account not marked";
    string public constant YIELDTOKEN_TRANSFER_AMOUNT_EXCEEDS_ALLOWANCE         = "YieldToken: transfer amount exceeds allowance";
    string public constant YIELDTOKEN_MINT_TO_THE_ZERO_ADDRESS                  = "YieldToken: mint to the zero address";
    string public constant YIELDTOKEN_BURN_FROM_THE_ZERO_ADDRESS                = "YieldToken: burn from the zero address";
    string public constant YIELDTOKEN_BURN_AMOUNT_EXCEEDS_BALANCE               = "YieldToken: burn amount exceeds balance";
    string public constant YIELDTOKEN_TRANSFER_FROM_THE_ZERO_ADDRESS            = "YieldToken: transfer from the zero address";
    string public constant YIELDTOKEN_TRANSFER_TO_THE_ZERO_ADDRESS              = "YieldToken: transfer to the zero address";
    string public constant YIELDTOKEN_MSG_SENDER_NOT_WHITELISTED                = "YieldToken: msg.sender not whitelisted";
    string public constant YIELDTOKEN_TRANSFER_AMOUNT_EXCEEDS_BALANCE           = "YieldToken: transfer amount exceeds balance";
    string public constant YIELDTOKEN_APPROVE_FROM_THE_ZERO_ADDRESS             = "YieldToken: approve from the zero address";
    string public constant YIELDTOKEN_APPROVE_TO_THE_ZERO_ADDRESS               = "YieldToken: approve to the zero address";

    string public constant MINTABLEBASETOKEN_FORBIDDEN                          = "MintableBaseToken: forbidden";
    string public constant BASETOKEN_FORBIDDEN                                  = "BaseToken: forbidden";
    string public constant BASETOKEN_ACCOUNT_ALREADY_MARKED                     = "BaseToken: _account already marked";
    string public constant BASETOKEN_ACCOUNT_NOT_MARKED                         = "BaseToken: _account not marked";
    string public constant BASETOKEN_TRANSFER_AMOUNT_EXCEEDS_ALLOWANCE          = "BaseToken: transfer amount exceeds allowance";
    string public constant BASETOKEN_MINT_TO_THE_ZERO_ADDRESS                   = "BaseToken: mint to the zero address";
    string public constant BASETOKEN_BURN_FROM_THE_ZERO_ADDRESS                 = "BaseToken: burn from the zero address";
    string public constant BASETOKEN_BURN_AMOUNT_EXCEEDS_BALANCE                = "BaseToken: burn amount exceeds balance";
    string public constant BASETOKEN_TRANSFER_FROM_THE_ZERO_ADDRESS             = "BaseToken: transfer from the zero address";
    string public constant BASETOKEN_TRANSFER_TO_THE_ZERO_ADDRESS               = "BaseToken: transfer to the zero address";
    string public constant BASETOKEN_MSG_SENDER_NOT_WHITELISTED                 = "BaseToken: msg.sender not whitelisted";
    string public constant BASETOKEN_TRANSFER_AMOUNT_EXCEEDS_BALANCE            = "BaseToken: transfer amount exceeds balance";
    string public constant BASETOKEN_APPROVE_FROM_THE_ZERO_ADDRESS              = "BaseToken: approve from the zero address";
    string public constant BASETOKEN_APPROVE_TO_THE_ZERO_ADDRESS                = "BaseToken: approve to the zero address";
}


// File contracts/libraries/token/IERC20.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


// File contracts/libraries/math/SafeMath.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


// File contracts/libraries/utils/Address.sol

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.3._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.3._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


// File contracts/libraries/token/SafeERC20.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;



/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


// File contracts/tokens/interfaces/IYieldTracker.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IYieldTracker {
    function claim(address _account, address _receiver) external returns (uint256);
    function updateRewards(address _account) external;
    function getTokensPerInterval() external view returns (uint256);
    function claimable(address _account) external view returns (uint256);
}


// File contracts/tokens/interfaces/IYieldToken.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IYieldToken {
    function totalStaked() external view returns (uint256);
    function stakedBalance(address _account) external view returns (uint256);
    function removeAdmin(address _account) external;
}


// File contracts/core/storage/YieldTokenStorage.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;





abstract contract YieldTokenStorage is IERC20, IYieldToken {
    string public name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint256 public override totalSupply;
    uint256 public nonStakingSupply;
    bool public inWhitelistMode;
    address public gov;
    address[] public yieldTrackers;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowances;
    mapping (address => bool) public nonStakingAccounts;
    mapping (address => bool) public admins;
    mapping (address => bool) public whitelistedHandlers;
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    modifier onlyGov() {
        require(msg.sender == gov, "YieldToken: forbidden");
        _;
    }
    modifier onlyAdmin() {
        require(admins[msg.sender], "YieldToken: forbidden");
        _;
    }
}


// File contracts/tokens/YieldToken.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract YieldToken is YieldTokenStorage {
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) public {
        name = _name;
        symbol = _symbol;
        gov = msg.sender;
        admins[msg.sender] = true;
        _mint(msg.sender, _initialSupply);
    }
    function addAdmin(address _account) external onlyGov {
        admins[_account] = true;
    }
    function removeAdmin(address _account) external override onlyGov {
        admins[_account] = false;
    }
    function withdrawToken(address _token, address _account, uint256 _amount) external onlyGov {
        IERC20(_token).safeTransfer(_account, _amount);
    }
    function addNonStakingAccount(address _account) external onlyAdmin {
        require(!nonStakingAccounts[_account], Errors.YIELDTOKEN_ACCOUNT_ALREADY_MARKED);
        _updateRewards(_account);
        nonStakingAccounts[_account] = true;
        nonStakingSupply = nonStakingSupply.add(balances[_account]);
    }
    function removeNonStakingAccount(address _account) external onlyAdmin {
        require(nonStakingAccounts[_account], Errors.YIELDTOKEN_ACCOUNT_NOT_MARKED);
        _updateRewards(_account);
        nonStakingAccounts[_account] = false;
        nonStakingSupply = nonStakingSupply.sub(balances[_account]);
    }
    function recoverClaim(address _account, address _receiver) external onlyAdmin {
        for (uint256 i = 0; i < yieldTrackers.length; i++) {
            address yieldTracker = yieldTrackers[i];
            IYieldTracker(yieldTracker).claim(_account, _receiver);
        }
    }
    function claim(address _receiver) external {
        for (uint256 i = 0; i < yieldTrackers.length; i++) {
            address yieldTracker = yieldTrackers[i];
            IYieldTracker(yieldTracker).claim(msg.sender, _receiver);
        }
    }
    /* settings*/
    function setGov(address _gov) external onlyGov {
        gov = _gov;
    }
    function setInfo(string memory _name, string memory _symbol) external onlyGov {
        name = _name;
        symbol = _symbol;
    }
    function setYieldTrackers(address[] memory _yieldTrackers) external onlyGov {
        yieldTrackers = _yieldTrackers;
    }
    function setInWhitelistMode(bool _inWhitelistMode) external onlyGov {
        inWhitelistMode = _inWhitelistMode;
    }
    function setWhitelistedHandler(address _handler, bool _isWhitelisted) external onlyGov {
        whitelistedHandlers[_handler] = _isWhitelisted;
    }
    /* views */
    function totalStaked() external view override returns (uint256) {
        return totalSupply.sub(nonStakingSupply);
    }
    function balanceOf(address _account) external view override returns (uint256) {
        return balances[_account];
    }
    function stakedBalance(address _account) external view override returns (uint256) {
        if (nonStakingAccounts[_account]) {
            return 0;
        }
        return balances[_account];
    }
    function transfer(address _recipient, uint256 _amount) external override returns (bool) {
        _transfer(msg.sender, _recipient, _amount);
        return true;
    }
    function allowance(address _owner, address _spender) external view override returns (uint256) {
        return allowances[_owner][_spender];
    }
    function approve(address _spender, uint256 _amount) external override returns (bool) {
        _approve(msg.sender, _spender, _amount);
        return true;
    }
    function transferFrom(address _sender, address _recipient, uint256 _amount) external override returns (bool) {
        uint256 nextAllowance = allowances[_sender][msg.sender].sub(_amount, Errors.YIELDTOKEN_TRANSFER_AMOUNT_EXCEEDS_ALLOWANCE);
        _approve(_sender, msg.sender, nextAllowance);
        _transfer(_sender, _recipient, _amount);
        return true;
    }
    /*internal */
    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), Errors.YIELDTOKEN_MINT_TO_THE_ZERO_ADDRESS);
        _updateRewards(_account);
        totalSupply = totalSupply.add(_amount);
        balances[_account] = balances[_account].add(_amount);
        if (nonStakingAccounts[_account]) {
            nonStakingSupply = nonStakingSupply.add(_amount);
        }
        emit Transfer(address(0), _account, _amount);
    }
    function _burn(address _account, uint256 _amount) internal {
        require(_account != address(0), Errors.YIELDTOKEN_BURN_FROM_THE_ZERO_ADDRESS);
        _updateRewards(_account);
        balances[_account] = balances[_account].sub(_amount, Errors.YIELDTOKEN_BURN_AMOUNT_EXCEEDS_BALANCE);
        totalSupply = totalSupply.sub(_amount);
        if (nonStakingAccounts[_account]) {
            nonStakingSupply = nonStakingSupply.sub(_amount);
        }
        emit Transfer(_account, address(0), _amount);
    }
    function _transfer(address _sender, address _recipient, uint256 _amount) private {
        require(_sender != address(0), Errors.YIELDTOKEN_TRANSFER_FROM_THE_ZERO_ADDRESS);
        require(_recipient != address(0), Errors.YIELDTOKEN_TRANSFER_TO_THE_ZERO_ADDRESS);
        if (inWhitelistMode) {
            require(whitelistedHandlers[msg.sender], Errors.YIELDTOKEN_MSG_SENDER_NOT_WHITELISTED);
        }
        _updateRewards(_sender);
        _updateRewards(_recipient);
        balances[_sender] = balances[_sender].sub(_amount, Errors.YIELDTOKEN_TRANSFER_AMOUNT_EXCEEDS_BALANCE);
        balances[_recipient] = balances[_recipient].add(_amount);
        if (nonStakingAccounts[_sender]) {
            nonStakingSupply = nonStakingSupply.sub(_amount);
        }
        if (nonStakingAccounts[_recipient]) {
            nonStakingSupply = nonStakingSupply.add(_amount);
        }
        emit Transfer(_sender, _recipient,_amount);
    }
    function _approve(address _owner, address _spender, uint256 _amount) private {
        require(_owner != address(0), Errors.YIELDTOKEN_APPROVE_FROM_THE_ZERO_ADDRESS);
        require(_spender != address(0), Errors.YIELDTOKEN_APPROVE_TO_THE_ZERO_ADDRESS);
        allowances[_owner][_spender] = _amount;
        emit Approval(_owner, _spender, _amount);
    }
    function _updateRewards(address _account) private {
        for (uint256 i = 0; i < yieldTrackers.length; i++) {
            address yieldTracker = yieldTrackers[i];
            IYieldTracker(yieldTracker).updateRewards(_account);
        }
    }
}


// File contracts/tokens/ZKUSD.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;




contract ZKUSD is YieldToken, IZKUSD {
    mapping (address => bool) public vaults;
    modifier onlyVault() {
        require(vaults[msg.sender], Errors.ZKUSD_FORBIDDEN);
        _;
    }
    constructor(address _vault) public YieldToken(Constants.ZKUSD_TOKEN_NAME, Constants.ZKUSD_TOKEN_SYMBOL, 0) {
        vaults[_vault] = true;
    }
    function addVault(address _vault) external override onlyGov {
        vaults[_vault] = true;
    }
    function removeVault(address _vault) external override onlyGov {
        vaults[_vault] = false;
    }
    function mint(address _account, uint256 _amount) external override onlyVault {
        _mint(_account, _amount);
    }
    function burn(address _account, uint256 _amount) external override onlyVault {
        _burn(_account, _amount);
    }
}

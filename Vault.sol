// Sources flattened with hardhat v2.7.0 https://hardhat.org

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


// File contracts/libraries/DataTypes.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

library DataTypes {
    struct IncreaseOrder {
        address account;
        address purchaseToken;
        uint256 purchaseTokenAmount;
        address collateralToken;
        address indexToken;
        uint256 sizeDelta;
        bool isLong;
        uint256 triggerPrice;
        bool triggerAboveThreshold;
        uint256 executionFee;
    }
    struct DecreaseOrder {
        address account;
        address collateralToken;
        uint256 collateralDelta;
        address indexToken;
        uint256 sizeDelta;
        bool isLong;
        uint256 triggerPrice;
        bool triggerAboveThreshold;
        uint256 executionFee;
    }
    struct SwapOrder {
        address account;
        address[] path;
        uint256 amountIn;
        uint256 minOut;
        uint256 triggerRatio;
        bool triggerAboveThreshold;
        bool shouldUnwrap;
        uint256 executionFee;
    }

    /* Vault.sol */
    struct Position {
        uint256 size;
        uint256 collateral;
        uint256 averagePrice; // col average price
        uint256 entryFundingRate;
        uint256 reserveAmount;
        int256 realisedPnl;
        uint256 lastIncreasedTime;
    }
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


// File contracts/libraries/Events.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
library Events {
    /* BasePositionManager Events */
    event SetDepositFee(uint256 depositFee);
    event SetIncreasePositionBufferBps(uint256 increasePositionBufferBps);
    event SetReferralStorage(address referralStorage);
    event SetAdmin(address admin);
    event WithdrawFees(address token, address receiver, uint256 amount);
    event SetMaxGlobalSizes(address[] tokens, uint256[] longSizes, uint256[] shortSizes);
    event IncreasePositionReferral(address account, uint256 sizeDelta, uint256 marginFeeBasisPoints, bytes32 referralCode, address referrer);
    event DecreasePositionReferral(address account, uint256 sizeDelta, uint256 marginFeeBasisPoints, bytes32 referralCode, address referrer);
    /*Position Manager Events*/
    event SetOrderKeeper(address indexed account, bool isActive);
    event SetLiquidator(address indexed account, bool isActive);
    event SetPartner(address account, bool isActive);
    event SetOpened(bool opened);
    event SetShouldValidateIncreaseOrder(bool shouldValidateIncreaseOrder);
    /* Orderbook.sol events */
    event CreateIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address purchaseToken, uint256 purchaseTokenAmount,
        address collateralToken, address indexToken,
        uint256 sizeDelta, bool isLong, uint256 triggerPrice,
        bool triggerAboveThreshold, uint256 executionFee);
    event CancelIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address purchaseToken, uint256 purchaseTokenAmount,
        address collateralToken, address indexToken,
        uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee);
    event ExecuteIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address purchaseToken, uint256 purchaseTokenAmount,
        address collateralToken, address indexToken, uint256 sizeDelta,
        bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee, uint256 executionPrice);
    event UpdateIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, address indexToken,
        bool isLong, uint256 sizeDelta, uint256 triggerPrice, bool triggerAboveThreshold);
    event CreateDecreaseOrder(address indexed account, uint256 orderIndex, address collateralToken, uint256 collateralDelta, address indexToken, uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee);
    event CancelDecreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, uint256 collateralDelta, address indexToken,
        uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee);
    event ExecuteDecreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, uint256 collateralDelta,
        address indexToken, uint256 sizeDelta, bool isLong,
        uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee, uint256 executionPrice);
    event UpdateDecreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, uint256 collateralDelta,
        address indexToken, uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold);
    event CreateSwapOrder(
        address indexed account, uint256 orderIndex,
        address[] path, uint256 amountIn, uint256 minOut,
        uint256 triggerRatio, bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event CancelSwapOrder(
        address indexed account, uint256 orderIndex,
        address[] path, uint256 amountIn, uint256 minOut,
        uint256 triggerRatio, bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event UpdateSwapOrder(
        address indexed account, uint256 ordexIndex, address[] path, uint256 amountIn, uint256 minOut, uint256 triggerRatio, bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event ExecuteSwapOrder(
        address indexed account, uint256 orderIndex,
        address[] path, uint256 amountIn, uint256 minOut,
        uint256 amountOut, uint256 triggerRatio,
        bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event Initialize(
        address router, address vault, address weth,
        address zkusd, uint256 minExecutionFee, uint256 minPurchaseTokenAmountUsd);
    event UpdateMinExecutionFee(uint256 minExecutionFee);
    event UpdateMinPurchaseTokenAmountUsd(uint256 minPurchaseTokenAmountUsd);
    event UpdateGov(address gov);
    /* Router.sol events*/
    event Swap(address account, address tokenIn, address tokenOut, uint256 amountIn, uint256 amountOut);
    /* ShortsTracker.sol events*/
    event GlobalShortDataUpdated(address indexed token, uint256 globalShortSize, uint256 globalShortAveragePrice);
    /* Vault.sol events */
    event BuyZKUSD(
        address account, address token,
        uint256 tokenAmount, uint256 zkusdAmount, uint256 feeBasisPoints);
    event SellZKUSD(
        address account, address token,
        uint256 zkusdAmount, uint256 tokenAmount, uint256 feeBasisPoints);
    event Swap(
        address account, address tokenIn,
        address tokenOut, uint256 amountIn,
        uint256 amountOut, uint256 amountOutAfterFees,
        uint256 feeBasisPoints);
    event IncreasePosition(
        bytes32 key, address account,
        address collateralToken, address indexToken,
        uint256 collateralDelta, uint256 sizeDelta,
        bool isLong, uint256 price, uint256 fee);
    event DecreasePosition(
        bytes32 key, address account,
        address collateralToken, address indexToken,
        uint256 collateralDelta, uint256 sizeDelta,
        bool isLong, uint256 price, uint256 fee);
    event LiquidatePosition(
        bytes32 key, address account, address collateralToken,
        address indexToken, bool isLong, uint256 size,
        uint256 collateral, uint256 reserveAmount, int256 realisedPnl, uint256 markPrice);
    event UpdatePosition(
        bytes32 key, uint256 size, uint256 collateral,
        uint256 averagePrice, uint256 entryFundingRate,
        uint256 reserveAmount, int256 realisedPnl, uint256 markPrice);
    event ClosePosition(
        bytes32 key, uint256 size, uint256 collateral,
        uint256 averagePrice, uint256 entryFundingRate, uint256 reserveAmount, int256 realisedPnl);
    event UpdateFundingRate(address token, uint256 fundingRate);
    event UpdatePnl(bytes32 key, bool hasProfit, uint256 delta);
    event CollectSwapFees(address token, uint256 feeUsd, uint256 feeTokens);
    event CollectMarginFees(address token, uint256 feeUsd, uint256 feeTokens);
    event DirectPoolDeposit(address token, uint256 amount);
    event IncreasePoolAmount(address token, uint256 amount);
    event DecreasePoolAmount(address token, uint256 amount);
    event IncreaseZkusdAmount(address token, uint256 amount);
    event DecreaseZkusdAmount(address token, uint256 amount);
    event IncreaseReservedAmount(address token, uint256 amount);
    event DecreaseReservedAmount(address token, uint256 amount);
    event IncreaseGuaranteedUsd(address token, uint256 amount);
    event DecreaseGuaranteedUsd(address token, uint256 amount);
    /* Timelock.sol events */
    event SignalPendingAction(bytes32 action);
    event SignalApprove(address token, address spender, uint256 amount, bytes32 action);
    event SignalWithdrawToken(address target, address token, address receiver, uint256 amount, bytes32 action);
    event SignalMint(address token, address receiver, uint256 amount, bytes32 action);
    event SignalSetGov(address target, address gov, bytes32 action);
    event SignalSetHandler(address target, address handler, bool isActive, bytes32 action);
    event SignalSetPriceFeed(address vault, address priceFeed, bytes32 action);
    event SignalRedeemZkusd(address vault, address token, uint256 amount);
    event SignalVaultSetTokenConfig(
        address vault, address token, uint256 tokenDecimals,
        uint256 tokenWeight, uint256 minProfitBps, uint256 maxZkusdAmount,
        bool isStable, bool isShortable);
    event ClearAction(bytes32 action);
    /* ZkdlpManager.sol */
    event AddLiquidity(address account, address token, uint256 amount, uint256 aumInUsd, uint256 zkdlpSupply, uint256 zkusdAmount, uint256 mintAmount);
    event RemoveLiquidity(address account, address token, uint256 zkdlpAmount, uint256 aumInUsd, uint256 zkdlpSupply, uint256 zkusdAmount, uint256 amountOut);
    /* RewardRouterV2 */
    event StakeZkdx(address account, address token, uint256 amount);
    event UnstakeZkdx(address account, address token, uint256 amount);
    event StakeZkdlp(address account, uint256 amount);
    event UnstakeZkdlp(address account, uint256 amount);
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


// File contracts/libraries/utils/ReentrancyGuard.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor () internal {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}


// File contracts/core/interfaces/IVaultUtils.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IVaultUtils {
    function updateCumulativeFundingRate(
        address _collateralToken, address _indexToken) external returns (bool);
    function validateIncreasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _sizeDelta, bool _isLong) external view;
    function validateDecreasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _collateralDelta,
        uint256 _sizeDelta, bool _isLong, address _receiver) external view;
    function validateLiquidation(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, bool _raise) external view returns (uint256, uint256);
    function getEntryFundingRate(
        address _collateralToken, address _indexToken, bool _isLong) external view returns (uint256);
    function getPositionFee(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, uint256 _sizeDelta) external view returns (uint256);
    function getFundingFee(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong,
        uint256 _size, uint256 _entryFundingRate) external view returns (uint256);
    function getBuyZkusdFeeBasisPoints(
        address _token, uint256 _zkusdAmount) external view returns (uint256);
    function getSellZkusdFeeBasisPoints(
        address _token, uint256 _zkusdAmount) external view returns (uint256);
    function getSwapFeeBasisPoints(
        address _tokenIn, address _tokenOut, uint256 _zkusdAmount) external view returns (uint256);
    function getFeeBasisPoints(
        address _token, uint256 _zkusdDelta,
        uint256 _feeBasisPoints, uint256 _taxBasisPoints,
        bool _increment) external view returns (uint256);
}


// File contracts/core/interfaces/IVault.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IVault {
    function withdrawFees(address _token, address _receiver) external returns (uint256);
    function directPoolDeposit(address _token) external;
    function buyZKUSD(address _token, address _receiver) external returns (uint256);
    function sellZKUSD(address _token, address _receiver) external returns (uint256);
    function swap(address _tokenIn, address _tokenOut, address _receiver) external returns (uint256);
    function increasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _sizeDelta, bool _isLong) external;
    function decreasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _collateralDelta,
        uint256 _sizeDelta, bool _isLong, address _receiver) external returns (uint256);
    function validateLiquidation(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, bool _raise) external view returns (uint256, uint256);
    function liquidatePosition(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, address _feeReceiver) external;

    function tokenToUsdMin(address _token, uint256 _tokenAmount) external view returns (uint256);
    function priceFeed() external view returns (address);
    function fundingRateFactor() external view returns (uint256);
    function stableFundingRateFactor() external view returns (uint256);
    function cumulativeFundingRates(address _token) external view returns (uint256);
    function getNextFundingRate(address _token) external view returns (uint256);
    function getFeeBasisPoints(
        address _token, uint256 _zkusdDelta,
        uint256 _feeBasisPoints, uint256 _taxBasisPoints, bool _increment) external view returns (uint256);
    function liquidationFeeUsd() external view returns (uint256);
    function taxBasisPoints() external view returns (uint256);
    function stableTaxBasisPoints() external view returns (uint256);
    function mintBurnFeeBasisPoints() external view returns (uint256);
    function swapFeeBasisPoints() external view returns (uint256);
    function stableSwapFeeBasisPoints() external view returns (uint256);
    function marginFeeBasisPoints() external view returns (uint256);
    function allWhitelistedTokensLength() external view returns (uint256);
    function allWhitelistedTokens(uint256) external view returns (address);
    function whitelistedTokens(address _token) external view returns (bool);
    function stableTokens(address _token) external view returns (bool);
    function shortableTokens(address _token) external view returns (bool);
    function feeReserves(address _token) external view returns (uint256);
    function globalShortSizes(address _token) external view returns (uint256);
    function globalShortAveragePrices(address _token) external view returns (uint256);
    function maxGlobalShortSizes(address _token) external view returns (uint256);
    function tokenDecimals(address _token) external view returns (uint256);
    function tokenWeights(address _token) external view returns (uint256);
    function guaranteedUsd(address _token) external view returns (uint256);
    function poolAmounts(address _token) external view returns (uint256);
    function bufferAmounts(address _token) external view returns (uint256);
    function reservedAmounts(address _token) external view returns (uint256);
    function zkusdAmounts(address _token) external view returns (uint256);
    function maxZkusdAmounts(address _token) external view returns (uint256);
    function getRedemptionAmount(address _token, uint256 _zkusdAmount) external view returns (uint256);
    function getMaxPrice(address _token) external view returns (uint256);
    function getMinPrice(address _token) external view returns (uint256);
    function getDelta(
        address _indexToken, uint256 _size,
        uint256 _averagePrice, bool _isLong, uint256 _lastIncreasedTime) external view returns (bool, uint256);
    function getPosition(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong) external view returns (uint256, uint256, uint256, uint256, uint256, uint256, bool, uint256);
    function isInitialized() external view returns (bool);
    function isSwapEnabled() external view returns (bool);
    function isLeverageEnabled() external view returns (bool);
    function router() external view returns (address);
    function zkusd() external view returns (address);
    function gov() external view returns (address);
    function whitelistedTokenCount() external view returns (uint256);
    function maxLeverage() external view returns (uint256);
    function minProfitTime() external view returns (uint256);
    function hasDynamicFees() external view returns (bool);
    function fundingInterval() external view returns (uint256);
    function totalTokenWeights() external view returns (uint256);
    function getTargetZkusdAmount(address _token) external view returns (uint256);
    function inManagerMode() external view returns (bool);
    function inPrivateLiquidationMode() external view returns (bool);
    function maxGasPrice() external view returns (uint256);
    function approvedRouters(address _account, address _router) external view returns (bool);
    function isLiquidator(address _account) external view returns (bool);
    function isManager(address _account) external view returns (bool);
    function minProfitBasisPoints(address _token) external view returns (uint256);
    function tokenBalances(address _token) external view returns (uint256);
    function lastFundingTimes(address _token) external view returns (uint256);

    function setMaxLeverage(uint256 _maxLeverage) external;
    function setInManagerMode(bool _inManagerMode) external;
    function setManager(address _manager, bool _isManager) external;
    function setIsSwapEnabled(bool _isSwapEnabled) external;
    function setIsLeverageEnabled(bool _isLeverageEnabled) external;
    function setMaxGasPrice(uint256 _maxGasPrice) external;
    function setZkusdAmount(address _token, uint256 _amount) external;
    function setBufferAmount(address _token, uint256 _amount) external;
    function setMaxGlobalShortSize(address _token, uint256 _amount) external;
    function setInPrivateLiquidationMode(bool _inPrivateLiquidationMode) external;
    function setLiquidator(address _liquidator, bool _isActive) external;
    function setFundingRate(
        uint256 _fundingInterval, uint256 _fundingRateFactor,
        uint256 _stableFundingRateFactor) external;
    function setFees(
        uint256 _taxBasisPoints, uint256 _stableTaxBasisPoints,
        uint256 _mintBurnFeeBasisPoints, uint256 _swapFeeBasisPoints,
        uint256 _stableSwapFeeBasisPoints, uint256 _marginFeeBasisPoints,
        uint256 _liquidationFeeUsd, uint256 _minProfitTime, bool _hasDynamicFees) external;

    function setTokenConfig(
        address _token, uint256 _tokenDecimals,
        uint256 _redemptionBps, uint256 _minProfitBps,
        uint256 _maxZkusdAmount, bool _isStable, bool _isShortable) external;
    function setPriceFeed(address _priceFeed) external;
    function setVaultUtils(IVaultUtils _vaultUtils) external;
    function setError(uint256 _errorCode, string calldata _error) external;
}


// File contracts/core/interfaces/IVaultPriceFeed.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IVaultPriceFeed {
    function adjustmentBasisPoints(address _token) external view returns (uint256);
    function isAdjustmentAdditive(address _token) external view returns (bool);
    function setAdjustment(address _token, bool _isAdditive, uint256 _adjustmentBps) external;
    function setUseV2Pricing(bool _useV2Pricing) external;
    function setIsAmmEnabled(bool _isEnabled) external;
    function setIsSecondaryPriceEnabled(bool _isEnabled) external;
    function setSpreadBasisPoints(address _token, uint256 _spreadBasisPoints) external;
    function setSpreadThresholdBasisPoints(uint256 _spreadThresholdBasisPoints) external;
    function setFavorPrimaryPrice(bool _favorPrimaryPrice) external;
    function setPriceSampleSpace(uint256 _priceSampleSpace) external;
    function setMaxStrictPriceDeviation(uint256 _maxStrictPriceDeviation) external;
    function getPrice(address _token, bool _maximise, bool _includeAmmPrice, bool _useSwapPricing) external view returns (uint256);
    function getAmmPrice(address _token) external view returns (uint256);
    function getLatestPrimaryPrice(address _token) external view returns (uint256);
    function getPrimaryPrice(address _token, bool _maximise) external view returns (uint256);
    function setTokenConfig(
        address _token, address _priceFeed,
        uint256 _priceDecimals, bool _isStrictStable) external;
}


// File contracts/tokens/interfaces/IZKUSD.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IZKUSD {
    function addVault(address _vault) external;
    function removeVault(address _vault) external;
    function mint(address _account, uint256 _amount) external;
    function burn(address _account, uint256 _amount) external;
}


// File contracts/core/storage/VaultAggregators.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;












abstract contract VaultAggregators is IVault, ReentrancyGuard {
}


// File contracts/core/storage/VaultStorage.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

abstract contract VaultStorage is VaultAggregators {
    /* constructor */
    address public override gov;
    bool public override isInitialized;
    address public override router;
    address public override zkusd;
    address public override priceFeed;
    uint256 public override liquidationFeeUsd;
    uint256 public override fundingRateFactor;
    uint256 public override stableFundingRateFactor;
    /* Logic */
    mapping(bytes32 => DataTypes.Position) public positions; //done
    mapping(address => uint256) public override poolAmounts; //Token => Pool Amount
    mapping(address => uint256) public override reservedAmounts; // Token=> Debt Amount
    uint256 public override maxLeverage = 50 * 10000; // 50x
    uint256 public override taxBasisPoints = 50; // 0.5%
    uint256 public override stableTaxBasisPoints = 20; // 0.2%
    uint256 public override mintBurnFeeBasisPoints = 30; // 0.3%
    uint256 public override swapFeeBasisPoints = 30; // 0.3%
    uint256 public override stableSwapFeeBasisPoints = 4; // 0.04%
    uint256 public override marginFeeBasisPoints = 10; // 0.1%
    uint256 public override fundingInterval = 1 hours;
    uint256 public override whitelistedTokenCount;
    uint256 public override maxGasPrice;
    uint256 public override minProfitTime;
    bool public override isSwapEnabled = true;
    bool public override isLeverageEnabled = true;
    bool public override hasDynamicFees = false;
    bool public includeAmmPrice = true;
    bool public useSwapPricing = false;
    bool public override inManagerMode = false;
    bool public override inPrivateLiquidationMode = false;
    IVaultUtils public vaultUtils;
    address public errorController;
    mapping(address => mapping(address => bool)) public override approvedRouters;
    mapping(address => bool) public override isLiquidator;
    mapping(address => bool) public override isManager;
    mapping(address => uint256) public override minProfitBasisPoints;
    mapping(address => bool) public override stableTokens;
    mapping(address => bool) public override shortableTokens;
    mapping(address => uint256) public override bufferAmounts;
    mapping(address => uint256) public override guaranteedUsd; // long debt - usd
    mapping(address => uint256) public override cumulativeFundingRates;  // borrow fee
    mapping(address => uint256) public override lastFundingTimes;
    mapping(address => uint256) public override feeReserves; // fee token=>balance
    mapping(address => uint256) public override globalShortSizes; // short debt = usd
    mapping(address => uint256) public override globalShortAveragePrices;
    mapping(address => uint256) public override maxGlobalShortSizes;
    mapping(uint256 => string) public errors;
    /* Token Settings*/
    mapping(address => uint256) public override tokenDecimals;
    mapping(address => uint256) public override tokenBalances;
    mapping(address => uint256) public override tokenWeights;
    uint256 public override totalTokenWeights;
    /* others */
    address[] public override allWhitelistedTokens;
    mapping(address => bool) public override whitelistedTokens;
    mapping(address => uint256) public override zkusdAmounts;
    mapping(address => uint256) public override maxZkusdAmounts;
    /* misc */
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
}


// File contracts/core/settings/VaultSettings.sol

// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

abstract contract VaultSettings is VaultStorage {
    function _onlyGov() internal view {
        _validate(msg.sender == gov, 53);
    }
    function setVaultUtils(IVaultUtils _vaultUtils) external override {
        _onlyGov();
        vaultUtils = _vaultUtils;
    }
    function setErrorController(address _errorController) external {
        _onlyGov();
        errorController = _errorController;
    }
    function setError(uint256 _errorCode, string calldata _error) external override {
        require(msg.sender == errorController, Errors.VAULT_INVALID_ERRORCONTROLLER);
        errors[_errorCode] = _error;
    }
    function setInManagerMode(bool _inManagerMode) external override {
        _onlyGov();
        inManagerMode = _inManagerMode;
    }
    function setManager(address _manager, bool _isManager) external override {
        _onlyGov();
        isManager[_manager] = _isManager;
    }
    function setInPrivateLiquidationMode(bool _inPrivateLiquidationMode) external override {
        _onlyGov();
        inPrivateLiquidationMode = _inPrivateLiquidationMode;
    }
    function setLiquidator(address _liquidator, bool _isActive) external override {
        _onlyGov();
        isLiquidator[_liquidator] = _isActive;
    }
    function setIsSwapEnabled(bool _isSwapEnabled) external override {
        _onlyGov();
        isSwapEnabled = _isSwapEnabled;
    }
    function setIsLeverageEnabled(bool _isLeverageEnabled) external override {
        _onlyGov();
        isLeverageEnabled = _isLeverageEnabled;
    }
    function setMaxGasPrice(uint256 _maxGasPrice) external override {
        _onlyGov();
        maxGasPrice = _maxGasPrice;
    }
    function setGov(address _gov) external {
        _onlyGov();
        gov = _gov;
    }
    function setPriceFeed(address _priceFeed) external override {
        _onlyGov();
        priceFeed = _priceFeed;
    }
    function setMaxLeverage(uint256 _maxLeverage) external override {
        _onlyGov();
        _validate(_maxLeverage > Constants.MIN_LEVERAGE, 2);
        maxLeverage = _maxLeverage;
    }
    function setBufferAmount(address _token, uint256 _amount) external override {
        _onlyGov();
        bufferAmounts[_token] = _amount;
    }
    function setMaxGlobalShortSize(address _token, uint256 _amount) external override {
        _onlyGov();
        maxGlobalShortSizes[_token] = _amount;
    }
    function setFees(
        uint256 _taxBasisPoints, uint256 _stableTaxBasisPoints,
        uint256 _mintBurnFeeBasisPoints, uint256 _swapFeeBasisPoints,
        uint256 _stableSwapFeeBasisPoints, uint256 _marginFeeBasisPoints,
        uint256 _liquidationFeeUsd, uint256 _minProfitTime, bool _hasDynamicFees) external override {

        _onlyGov();
        _validate(_taxBasisPoints <= Constants.MAX_FEE_BASIS_POINTS, 3);
        _validate(_stableTaxBasisPoints <= Constants.MAX_FEE_BASIS_POINTS, 4);
        _validate(_mintBurnFeeBasisPoints <= Constants.MAX_FEE_BASIS_POINTS, 5);
        _validate(_swapFeeBasisPoints <= Constants.MAX_FEE_BASIS_POINTS, 6);
        _validate(_stableSwapFeeBasisPoints <= Constants.MAX_FEE_BASIS_POINTS, 7);
        _validate(_marginFeeBasisPoints <= Constants.MAX_FEE_BASIS_POINTS, 8);
        _validate(_liquidationFeeUsd <= Constants.MAX_LIQUIDATION_FEE_USD, 9);
        taxBasisPoints = _taxBasisPoints;
        stableTaxBasisPoints = _stableTaxBasisPoints;
        mintBurnFeeBasisPoints = _mintBurnFeeBasisPoints;
        swapFeeBasisPoints = _swapFeeBasisPoints;
        stableSwapFeeBasisPoints = _stableSwapFeeBasisPoints;
        marginFeeBasisPoints = _marginFeeBasisPoints;
        liquidationFeeUsd = _liquidationFeeUsd;
        minProfitTime = _minProfitTime;
        hasDynamicFees = _hasDynamicFees;
    }
    function setFundingRate(uint256 _fundingInterval, uint256 _fundingRateFactor, uint256 _stableFundingRateFactor) external override {
        _onlyGov();
        // TODO K
//        _validate(_fundingInterval >= Constants.MIN_FUNDING_RATE_INTERVAL, 10);
//        _validate(_fundingRateFactor <= Constants.MAX_FUNDING_RATE_FACTOR, 11);
//        _validate(_stableFundingRateFactor <= Constants.MAX_FUNDING_RATE_FACTOR, 12);
        fundingInterval = _fundingInterval;
        fundingRateFactor = _fundingRateFactor;
        stableFundingRateFactor = _stableFundingRateFactor;
    }
    function setTokenConfig(
        address _token, uint256 _tokenDecimals,
        uint256 _tokenWeight, uint256 _minProfitBps,
        uint256 _maxZkusdAmount, bool _isStable, bool _isShortable) external override {
        _onlyGov();
        if (!whitelistedTokens[_token]) {
            whitelistedTokenCount = whitelistedTokenCount.add(1);
            allWhitelistedTokens.push(_token);
        }
        uint256 _totalTokenWeights = totalTokenWeights;
        _totalTokenWeights = _totalTokenWeights.sub(tokenWeights[_token]);

        whitelistedTokens[_token] = true;
        tokenDecimals[_token] = _tokenDecimals;
        tokenWeights[_token] = _tokenWeight;
        minProfitBasisPoints[_token] = _minProfitBps;
        maxZkusdAmounts[_token] = _maxZkusdAmount;
        stableTokens[_token] = _isStable;
        shortableTokens[_token] = _isShortable;
        totalTokenWeights = _totalTokenWeights.add(_tokenWeight);
        getMaxPrice(_token);
    }
    function setZkusdAmount(address _token, uint256 _amount) external override {
        _onlyGov();
        uint256 zkusdAmount = zkusdAmounts[_token];
        if (_amount > zkusdAmount) {
            _increaseZkusdAmount(_token, _amount.sub(zkusdAmount));
            return;
        }
        _decreaseZkusdAmount(_token, zkusdAmount.sub(_amount));
    }
    function _validate(bool _condition, uint256 _errorCode) internal view {
        require(_condition, errors[_errorCode]);
    }
    function _increaseZkusdAmount(address _token, uint256 _amount) internal {
        zkusdAmounts[_token] = zkusdAmounts[_token].add(_amount);
        uint256 maxZkusdAmount = maxZkusdAmounts[_token];
        if (maxZkusdAmount != 0) {
            _validate(zkusdAmounts[_token] <= maxZkusdAmount, 51);
        }
        emit Events.IncreaseZkusdAmount(_token, _amount);
    }
    function _decreaseZkusdAmount(address _token, uint256 _amount) internal {
        uint256 value = zkusdAmounts[_token];
        if (value <= _amount) {
            zkusdAmounts[_token] = 0;
            emit Events.DecreaseZkusdAmount(_token, value);
            return;
        }
        zkusdAmounts[_token] = value.sub(_amount);
        emit Events.DecreaseZkusdAmount(_token, _amount);
    }
    function getMaxPrice(address _token) public override view returns (uint256) {
        return IVaultPriceFeed(priceFeed).getPrice(_token, true, includeAmmPrice, useSwapPricing);
    }




//    function getRedemptionCollateral(address _token) public view returns (uint256) {
//        if (stableTokens[_token]) {
//            return poolAmounts[_token];
//        }
//        uint256 collateral = usdToTokenMin(_token, guaranteedUsd[_token]);
//        return collateral.add(poolAmounts[_token]).sub(reservedAmounts[_token]);
//    }
//    function getRedemptionCollateralUsd(address _token) public view returns (uint256) {
//        return tokenToUsdMin(_token, getRedemptionCollateral(_token));
//    }
//    function getPositionDelta(address _account, address _collateralToken, address _indexToken, bool _isLong) public view returns (bool, uint256) {
//        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
//        DataTypes.Position memory position = positions[key];
//        return getDelta(_indexToken, position.size, position.averagePrice, _isLong, position.lastIncreasedTime);
//    }
//    function getUtilisation(address _token) public view returns (uint256) {
//        uint256 poolAmount = poolAmounts[_token];
//        if (poolAmount == 0) {return 0;}
//        return reservedAmounts[_token].mul(Constants.FUNDING_RATE_PRECISION).div(poolAmount);
//    }
//    function getPositionLeverage(address _account, address _collateralToken, address _indexToken, bool _isLong) public view returns (uint256) {
//        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
//        DataTypes.Position memory position = positions[key];
//        _validate(position.collateral > 0, 37);
//        return position.size.mul(Constants.BASIS_POINTS_DIVISOR).div(position.collateral);
//    }
//    function getGlobalShortDelta(address _token) public view returns (bool, uint256) {
//            uint256 size = globalShortSizes[_token];
//            if (size == 0) {return (false, 0);}
//            uint256 nextPrice = getMaxPrice(_token);
//            uint256 averagePrice = globalShortAveragePrices[_token];
//            uint256 priceDelta = averagePrice > nextPrice ? averagePrice.sub(nextPrice) : nextPrice.sub(averagePrice);
//            uint256 delta = size.mul(priceDelta).div(averagePrice);
//            bool hasProfit = averagePrice > nextPrice;
//            return (hasProfit, delta);
//        }
}


// File contracts/core/settings/VaultInternal.sol

// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

abstract contract VaultInternal is VaultSettings {
    function _reduceCollateral(
        address _account, address _collateralToken,
        address _indexToken, uint256 _collateralDelta,
        uint256 _sizeDelta, bool _isLong) internal returns (uint256, uint256) {

        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
        DataTypes.Position storage position = positions[key];
        uint256 fee = _collectMarginFees(_account, _collateralToken, _indexToken, _isLong, _sizeDelta, position.size, position.entryFundingRate);
        bool hasProfit;
        uint256 adjustedDelta;
        {
            (bool _hasProfit, uint256 delta) = getDelta(_indexToken, position.size, position.averagePrice, _isLong, position.lastIncreasedTime);
            hasProfit = _hasProfit;
            adjustedDelta = _sizeDelta.mul(delta).div(position.size);
        }
        uint256 usdOut;
        if (hasProfit && adjustedDelta > 0) {
            usdOut = adjustedDelta;
            position.realisedPnl = position.realisedPnl + int256(adjustedDelta);
            if (!_isLong) {
                uint256 tokenAmount = usdToTokenMin(_collateralToken, adjustedDelta);
                _decreasePoolAmount(_collateralToken, tokenAmount);
            }
        }
        if (!hasProfit && adjustedDelta > 0) {
            position.collateral = position.collateral.sub(adjustedDelta);
            if (!_isLong) {
                uint256 tokenAmount = usdToTokenMin(_collateralToken, adjustedDelta);
                _increasePoolAmount(_collateralToken, tokenAmount);
            }
            position.realisedPnl = position.realisedPnl - int256(adjustedDelta);
        }
        if (_collateralDelta > 0) {
            usdOut = usdOut.add(_collateralDelta);
            position.collateral = position.collateral.sub(_collateralDelta);
        }
        if (position.size == _sizeDelta) {
            usdOut = usdOut.add(position.collateral);
            position.collateral = 0;
        }
        uint256 usdOutAfterFee = usdOut;
        if (usdOut > fee) {
            usdOutAfterFee = usdOut.sub(fee);
        } else {
            position.collateral = position.collateral.sub(fee);
            if (_isLong) {
                uint256 feeTokens = usdToTokenMin(_collateralToken, fee);
                _decreasePoolAmount(_collateralToken, feeTokens);
            }
        }
        emit Events.UpdatePnl(key, hasProfit, adjustedDelta);
        return (usdOut, usdOutAfterFee);
    }
    function _collectSwapFees(address _token, uint256 _amount, uint256 _feeBasisPoints) internal returns (uint256) {
        uint256 afterFeeAmount = _amount.mul(Constants.BASIS_POINTS_DIVISOR.sub(_feeBasisPoints)).div(Constants.BASIS_POINTS_DIVISOR);
        uint256 feeAmount = _amount.sub(afterFeeAmount);
        feeReserves[_token] = feeReserves[_token].add(feeAmount);
        emit Events.CollectSwapFees(_token, tokenToUsdMin(_token, feeAmount), feeAmount);
        return afterFeeAmount;
    }
    function _collectMarginFees(address _account, address _collateralToken, address _indexToken, bool _isLong, uint256 _sizeDelta, uint256 _size, uint256 _entryFundingRate) internal returns (uint256) {
        uint256 feeUsd = getPositionFee(_account, _collateralToken, _indexToken, _isLong, _sizeDelta);
        uint256 fundingFee = getFundingFee(_account, _collateralToken, _indexToken, _isLong, _size, _entryFundingRate);
        feeUsd = feeUsd.add(fundingFee);
        uint256 feeTokens = usdToTokenMin(_collateralToken, feeUsd);
        feeReserves[_collateralToken] = feeReserves[_collateralToken].add(feeTokens);
        emit Events.CollectMarginFees(_collateralToken, feeUsd, feeTokens);
        return feeUsd;
    }
    function _transferIn(address _token) internal returns (uint256) {
        uint256 prevBalance = tokenBalances[_token];
        uint256 nextBalance = IERC20(_token).balanceOf(address(this));
        tokenBalances[_token] = nextBalance;
        return nextBalance.sub(prevBalance);
    }
    function _transferOut(address _token, uint256 _amount, address _receiver) internal {
        IERC20(_token).safeTransfer(_receiver, _amount);
        tokenBalances[_token] = IERC20(_token).balanceOf(address(this));
    }
    function _updateTokenBalance(address _token) internal {
        uint256 nextBalance = IERC20(_token).balanceOf(address(this));
        tokenBalances[_token] = nextBalance;
    }
    function _increasePoolAmount(address _token, uint256 _amount) internal {
        poolAmounts[_token] = poolAmounts[_token].add(_amount);
        uint256 balance = IERC20(_token).balanceOf(address(this));
        _validate(poolAmounts[_token] <= balance, 49);
        emit Events.IncreasePoolAmount(_token, _amount);
    }
    function _decreasePoolAmount(address _token, uint256 _amount) internal {
        poolAmounts[_token] = poolAmounts[_token].sub(_amount, Errors.VAULT_POOLAMOUNT_EXCEEDED);
        _validate(reservedAmounts[_token] <= poolAmounts[_token], 50);
        emit Events.DecreasePoolAmount(_token, _amount);
    }
    function _increaseReservedAmount(address _token, uint256 _amount) internal {
        reservedAmounts[_token] = reservedAmounts[_token].add(_amount);
        _validate(reservedAmounts[_token] <= poolAmounts[_token], 52);
        emit Events.IncreaseReservedAmount(_token, _amount);
    }
    function _decreaseReservedAmount(address _token, uint256 _amount) internal {
        reservedAmounts[_token] = reservedAmounts[_token].sub(_amount, Errors.VAULT_INSUFFICIENT_RESERVE);
        emit Events.DecreaseReservedAmount(_token, _amount);
    }
    function _increaseGuaranteedUsd(address _token, uint256 _usdAmount) internal {
        guaranteedUsd[_token] = guaranteedUsd[_token].add(_usdAmount);
        emit Events.IncreaseGuaranteedUsd(_token, _usdAmount);
    }
    function _decreaseGuaranteedUsd(address _token, uint256 _usdAmount) internal {
        guaranteedUsd[_token] = guaranteedUsd[_token].sub(_usdAmount);
        emit Events.DecreaseGuaranteedUsd(_token, _usdAmount);
    }
    function _increaseGlobalShortSize(address _token, uint256 _amount) internal {
        globalShortSizes[_token] = globalShortSizes[_token].add(_amount);
        uint256 maxSize = maxGlobalShortSizes[_token];
        if (maxSize != 0) {
            require(globalShortSizes[_token] <= maxSize, Errors.VAULT_MAX_SHORTS_EXCEEDED);
        }
    }
    function _decreaseGlobalShortSize(address _token, uint256 _amount) internal {
        uint256 size = globalShortSizes[_token];
        if (_amount > size) {
            globalShortSizes[_token] = 0;
            return;
        }
        globalShortSizes[_token] = size.sub(_amount);
    }
    function _validateManager() internal view {
        if (inManagerMode) {
            _validate(isManager[msg.sender], 54);
        }
    }
    function _validateGasPrice() internal view {
        if (maxGasPrice == 0) {return;}
        _validate(tx.gasprice <= maxGasPrice, 55);
    }
    function _validatePosition(uint256 _size, uint256 _collateral) internal view {
        if (_size == 0) {
            _validate(_collateral == 0, 39);
            return;
        }
        _validate(_size >= _collateral, 40);
    }
    function _validateRouter(address _account) internal view {
        if (msg.sender == _account) {return;}
        if (msg.sender == router) {return;}
        _validate(approvedRouters[_account][msg.sender], 41);
    }
    function _validateTokens(address _collateralToken, address _indexToken, bool _isLong) internal view {
        if (_isLong) {
            _validate(_collateralToken == _indexToken, 42);
            _validate(whitelistedTokens[_collateralToken], 43);
            _validate(!stableTokens[_collateralToken], 44);
            return;
        }
        _validate(whitelistedTokens[_collateralToken], 45);
        _validate(stableTokens[_collateralToken], 46);
        _validate(!stableTokens[_indexToken], 47);
        _validate(shortableTokens[_indexToken], 48);
    }
    function _validateBufferAmount(address _token) internal view {
        if (poolAmounts[_token] < bufferAmounts[_token]) {
            revert(Errors.VAULT_POOLAMOUNT_BUFFER);
        }
    }
    /* views */
    function getNextGlobalShortAveragePrice(address _indexToken, uint256 _nextPrice, uint256 _sizeDelta) public view returns (uint256) {
        uint256 size = globalShortSizes[_indexToken];
        uint256 averagePrice = globalShortAveragePrices[_indexToken];
        uint256 priceDelta = averagePrice > _nextPrice ? averagePrice.sub(_nextPrice) : _nextPrice.sub(averagePrice);
        uint256 delta = size.mul(priceDelta).div(averagePrice);
        bool hasProfit = averagePrice > _nextPrice;
        uint256 nextSize = size.add(_sizeDelta);
        uint256 divisor = hasProfit ? nextSize.sub(delta) : nextSize.add(delta);
        return _nextPrice.mul(nextSize).div(divisor);
    }
    function getNextAveragePrice(address _indexToken, uint256 _size, uint256 _averagePrice, bool _isLong, uint256 _nextPrice, uint256 _sizeDelta, uint256 _lastIncreasedTime) public view returns (uint256) {
        (bool hasProfit, uint256 delta) = getDelta(_indexToken, _size, _averagePrice, _isLong, _lastIncreasedTime);
        uint256 nextSize = _size.add(_sizeDelta);
        uint256 divisor;
        if (_isLong) {
            divisor = hasProfit ? nextSize.add(delta) : nextSize.sub(delta);
        } else {
            divisor = hasProfit ? nextSize.sub(delta) : nextSize.add(delta);
        }
        return _nextPrice.mul(nextSize).div(divisor);
    }
    function getNextFundingRate(address _token) public override view returns (uint256) {
        if (lastFundingTimes[_token].add(fundingInterval) > block.timestamp) {return 0;}
        uint256 intervals = block.timestamp.sub(lastFundingTimes[_token]).div(fundingInterval);
        uint256 poolAmount = poolAmounts[_token];
        if (poolAmount == 0) {return 0;}
        uint256 _fundingRateFactor = stableTokens[_token] ? stableFundingRateFactor : fundingRateFactor;
        return _fundingRateFactor.mul(reservedAmounts[_token]).mul(intervals).div(poolAmount);
    }
    function getEntryFundingRate(address _collateralToken, address _indexToken, bool _isLong) public view returns (uint256) {
        return vaultUtils.getEntryFundingRate(_collateralToken, _indexToken, _isLong);
    }
    function getTargetZkusdAmount(address _token) public override view returns (uint256) {
        uint256 supply = IERC20(zkusd).totalSupply();
        if (supply == 0) {return 0;}
        uint256 weight = tokenWeights[_token];
        return weight.mul(supply).div(totalTokenWeights);
    }
    function getRedemptionAmount(address _token, uint256 _zkusdAmount) public override view returns (uint256) {
        uint256 price = getMaxPrice(_token);
        uint256 redemptionAmount = _zkusdAmount.mul(Constants.PRICE_PRECISION).div(price);
        return adjustForDecimals(redemptionAmount, zkusd, _token);
    }
    function getFeeBasisPoints(address _token, uint256 _zkusdDelta, uint256 _feeBasisPoints, uint256 _taxBasisPoints, bool _increment) public override view returns (uint256) {
        return vaultUtils.getFeeBasisPoints(_token, _zkusdDelta, _feeBasisPoints, _taxBasisPoints, _increment);
    }
    function getPositionKey(address _account, address _collateralToken, address _indexToken, bool _isLong) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_account, _collateralToken, _indexToken, _isLong));
    }
    function getPosition(address _account, address _collateralToken, address _indexToken, bool _isLong) public override view returns (uint256, uint256, uint256, uint256, uint256, uint256, bool, uint256) {
        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
        DataTypes.Position memory position = positions[key];
        uint256 realisedPnl = position.realisedPnl > 0 ? uint256(position.realisedPnl) : uint256(- position.realisedPnl);
        return (position.size, position.collateral, position.averagePrice, position.entryFundingRate, position.reserveAmount, realisedPnl, position.realisedPnl >= 0, position.lastIncreasedTime);
    }
    function getFundingFee(address _account, address _collateralToken, address _indexToken, bool _isLong, uint256 _size, uint256 _entryFundingRate) public view returns (uint256) {
        return vaultUtils.getFundingFee(_account, _collateralToken, _indexToken, _isLong, _size, _entryFundingRate);
    }
    function getMinPrice(address _token) public override view returns (uint256) {
        return IVaultPriceFeed(priceFeed).getPrice(_token, false, includeAmmPrice, useSwapPricing);
    }
    function getDelta(address _indexToken, uint256 _size, uint256 _averagePrice, bool _isLong, uint256 _lastIncreasedTime) public override view returns (bool, uint256) {
        _validate(_averagePrice > 0, 38);
        uint256 price = _isLong ? getMinPrice(_indexToken) : getMaxPrice(_indexToken);
        uint256 priceDelta = _averagePrice > price ? _averagePrice.sub(price) : price.sub(_averagePrice);
        uint256 delta = _size.mul(priceDelta).div(_averagePrice);
        bool hasProfit;
        if (_isLong) {
            hasProfit = price > _averagePrice;
        } else {
            hasProfit = _averagePrice > price;
        }
        uint256 minBps = block.timestamp > _lastIncreasedTime.add(minProfitTime) ? 0 : minProfitBasisPoints[_indexToken];
        if (hasProfit && delta.mul(Constants.BASIS_POINTS_DIVISOR) <= _size.mul(minBps)) {
            delta = 0;
        }
        return (hasProfit, delta);
    }
    function usdToTokenMax(address _token, uint256 _usdAmount) public view returns (uint256) {
        if (_usdAmount == 0) {return 0;}
        return usdToToken(_token, _usdAmount, getMinPrice(_token));
    }
    function usdToTokenMin(address _token, uint256 _usdAmount) public view returns (uint256) {
        if (_usdAmount == 0) {return 0;}
        return usdToToken(_token, _usdAmount, getMaxPrice(_token));
    }
    function tokenToUsdMin(address _token, uint256 _tokenAmount) public override view returns (uint256) {
        if (_tokenAmount == 0) {return 0;}
        uint256 price = getMinPrice(_token);
        uint256 decimals = tokenDecimals[_token];
        return _tokenAmount.mul(price).div(10 ** decimals);
    }
    function usdToToken(address _token, uint256 _usdAmount, uint256 _price) public view returns (uint256) {
        if (_usdAmount == 0) {return 0;}
        uint256 decimals = tokenDecimals[_token];
        return _usdAmount.mul(10 ** decimals).div(_price);
    }
    function adjustForDecimals(uint256 _amount, address _tokenDiv, address _tokenMul) public view returns (uint256) {
        uint256 decimalsDiv = _tokenDiv == zkusd ? Constants.ZKUSD_DECIMALS : tokenDecimals[_tokenDiv];
        uint256 decimalsMul = _tokenMul == zkusd ? Constants.ZKUSD_DECIMALS : tokenDecimals[_tokenMul];
        return _amount.mul(10 ** decimalsMul).div(10 ** decimalsDiv);
    }
    function validateLiquidation(address _account, address _collateralToken, address _indexToken, bool _isLong, bool _raise) override public view returns (uint256, uint256) {
        return vaultUtils.validateLiquidation(_account, _collateralToken, _indexToken, _isLong, _raise);
    }
    function getPositionFee(address _account, address _collateralToken, address _indexToken, bool _isLong, uint256 _sizeDelta) public view returns (uint256) {
        return vaultUtils.getPositionFee(_account, _collateralToken, _indexToken, _isLong, _sizeDelta);
    }
    function allWhitelistedTokensLength() external override view returns (uint256) {
        return allWhitelistedTokens.length;
    }
    /* funcs */
    function addRouter(address _router) external {
        approvedRouters[msg.sender][_router] = true;
    }
    function removeRouter(address _router) external {
        approvedRouters[msg.sender][_router] = false;
    }
    function upgradeVault(address _newVault, address _token, uint256 _amount) external {
        _onlyGov();
        IERC20(_token).safeTransfer(_newVault, _amount);
    }
}


// File contracts/core/Vault.sol

// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract Vault is VaultInternal {
    constructor() public {
        gov = msg.sender;
    }
    function initialize(address _router, address _zkusd, address _priceFeed, uint256 _liquidationFeeUsd, uint256 _fundingRateFactor, uint256 _stableFundingRateFactor) external {
        _onlyGov();
        _validate(!isInitialized, 1);
        isInitialized = true;
        router = _router;
        zkusd = _zkusd;
        priceFeed = _priceFeed;
        liquidationFeeUsd = _liquidationFeeUsd;
        fundingRateFactor = _fundingRateFactor;
        stableFundingRateFactor = _stableFundingRateFactor;
    }
    function clearTokenConfig(address _token) external {
        _onlyGov();
        _validate(whitelistedTokens[_token], 13);
        totalTokenWeights = totalTokenWeights.sub(tokenWeights[_token]);
        delete whitelistedTokens[_token];
        delete tokenDecimals[_token];
        delete tokenWeights[_token];
        delete minProfitBasisPoints[_token];
        delete maxZkusdAmounts[_token];
        delete stableTokens[_token];
        delete shortableTokens[_token];
        whitelistedTokenCount = whitelistedTokenCount.sub(1);
    }
    function withdrawFees(address _token, address _receiver) external override returns (uint256) {
        _onlyGov();
        uint256 amount = feeReserves[_token];
        if (amount == 0) {return 0;}
        feeReserves[_token] = 0;
        _transferOut(_token, amount, _receiver);
        return amount;
    }
    function directPoolDeposit(address _token) external override nonReentrant {
        _validate(whitelistedTokens[_token], 14);
        uint256 tokenAmount = _transferIn(_token);
        _validate(tokenAmount > 0, 15);
        _increasePoolAmount(_token, tokenAmount);
        emit Events.DirectPoolDeposit(_token, tokenAmount);
    }
    function buyZKUSD(address _token, address _receiver) external override nonReentrant returns (uint256) {
        _validateManager();
        _validate(whitelistedTokens[_token], 16);
        useSwapPricing = true;
        uint256 tokenAmount = _transferIn(_token);
        _validate(tokenAmount > 0, 17);
        updateCumulativeFundingRate(_token, _token);
        uint256 price = getMinPrice(_token);
        uint256 zkusdAmount = tokenAmount.mul(price).div(Constants.PRICE_PRECISION);
        zkusdAmount = adjustForDecimals(zkusdAmount, _token, zkusd);
        _validate(zkusdAmount > 0, 18);
        uint256 feeBasisPoints = vaultUtils.getBuyZkusdFeeBasisPoints(_token, zkusdAmount);
        uint256 amountAfterFees = _collectSwapFees(_token, tokenAmount, feeBasisPoints);
        uint256 mintAmount = amountAfterFees.mul(price).div(Constants.PRICE_PRECISION);
        mintAmount = adjustForDecimals(mintAmount, _token, zkusd);
        _increaseZkusdAmount(_token, mintAmount);
        _increasePoolAmount(_token, amountAfterFees);
        IZKUSD(zkusd).mint(_receiver, mintAmount);
        emit Events.BuyZKUSD(_receiver, _token, tokenAmount, mintAmount, feeBasisPoints);
        useSwapPricing = false;
        return mintAmount;
    }
    function sellZKUSD(address _token, address _receiver) external override nonReentrant returns (uint256) {
        _validateManager();
        _validate(whitelistedTokens[_token], 19);
        useSwapPricing = true;
        uint256 zkusdAmount = _transferIn(zkusd);
        _validate(zkusdAmount > 0, 20);
        updateCumulativeFundingRate(_token, _token);
        uint256 redemptionAmount = getRedemptionAmount(_token, zkusdAmount);
        _validate(redemptionAmount > 0, 21);
        _decreaseZkusdAmount(_token, zkusdAmount);
        _decreasePoolAmount(_token, redemptionAmount);
        IZKUSD(zkusd).burn(address(this), zkusdAmount);
        _updateTokenBalance(zkusd);

        uint256 feeBasisPoints = vaultUtils.getSellZkusdFeeBasisPoints(_token, zkusdAmount);
        uint256 amountOut = _collectSwapFees(_token, redemptionAmount, feeBasisPoints);
        _validate(amountOut > 0, 22);
        _transferOut(_token, amountOut, _receiver);
        emit Events.SellZKUSD(_receiver, _token, zkusdAmount, amountOut, feeBasisPoints);
        useSwapPricing = false;
        return amountOut;
    }
    function swap(address _tokenIn, address _tokenOut, address _receiver) external override nonReentrant returns (uint256) {
        _validate(isSwapEnabled, 23);
        _validate(whitelistedTokens[_tokenIn], 24);
        _validate(whitelistedTokens[_tokenOut], 25);
        _validate(_tokenIn != _tokenOut, 26);
        useSwapPricing = true;
        updateCumulativeFundingRate(_tokenIn, _tokenIn);
        updateCumulativeFundingRate(_tokenOut, _tokenOut);
        uint256 amountIn = _transferIn(_tokenIn);
        _validate(amountIn > 0, 27);
        uint256 priceIn = getMinPrice(_tokenIn);
        uint256 priceOut = getMaxPrice(_tokenOut);
        uint256 amountOut = amountIn.mul(priceIn).div(priceOut);
        amountOut = adjustForDecimals(amountOut, _tokenIn, _tokenOut);
        uint256 zkusdAmount = amountIn.mul(priceIn).div(Constants.PRICE_PRECISION);
        zkusdAmount = adjustForDecimals(zkusdAmount, _tokenIn, zkusd);
        uint256 feeBasisPoints = vaultUtils.getSwapFeeBasisPoints(_tokenIn, _tokenOut, zkusdAmount);
        uint256 amountOutAfterFees = _collectSwapFees(_tokenOut, amountOut, feeBasisPoints);

        _increaseZkusdAmount(_tokenIn, zkusdAmount);
        _decreaseZkusdAmount(_tokenOut, zkusdAmount);
        _increasePoolAmount(_tokenIn, amountIn);
        _decreasePoolAmount(_tokenOut, amountOut);
        _validateBufferAmount(_tokenOut);
        _transferOut(_tokenOut, amountOutAfterFees, _receiver);
        emit Events.Swap(_receiver, _tokenIn, _tokenOut, amountIn, amountOut, amountOutAfterFees, feeBasisPoints);
        useSwapPricing = false;
        return amountOutAfterFees;
    }
    function increasePosition(address _account, address _collateralToken, address _indexToken, uint256 _sizeDelta, bool _isLong) external override nonReentrant {
        _validate(isLeverageEnabled, 28);
        _validateGasPrice();
        _validateRouter(_account);
        _validateTokens(_collateralToken, _indexToken, _isLong);
        vaultUtils.validateIncreasePosition(_account, _collateralToken, _indexToken, _sizeDelta, _isLong);
        updateCumulativeFundingRate(_collateralToken, _indexToken);
        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
        DataTypes.Position storage position = positions[key];
        uint256 price = _isLong ? getMaxPrice(_indexToken) : getMinPrice(_indexToken);
        if (position.size == 0) {
            position.averagePrice = price;
        }
        if (position.size > 0 && _sizeDelta > 0) {
            position.averagePrice = getNextAveragePrice(_indexToken, position.size, position.averagePrice, _isLong, price, _sizeDelta, position.lastIncreasedTime);
        }

        uint256 fee = _collectMarginFees(_account, _collateralToken, _indexToken, _isLong, _sizeDelta, position.size, position.entryFundingRate);
        uint256 collateralDelta = _transferIn(_collateralToken);
        uint256 collateralDeltaUsd = tokenToUsdMin(_collateralToken, collateralDelta);
        
        position.collateral = position.collateral.add(collateralDeltaUsd);
        _validate(position.collateral >= fee, 29);
        position.collateral = position.collateral.sub(fee);
        position.entryFundingRate = getEntryFundingRate(_collateralToken, _indexToken, _isLong);
        position.size = position.size.add(_sizeDelta);
        position.lastIncreasedTime = block.timestamp;
        
        _validate(position.size > 0, 30);
        _validatePosition(position.size, position.collateral);
        validateLiquidation(_account, _collateralToken, _indexToken, _isLong, true);
        
        uint256 reserveDelta = usdToTokenMax(_collateralToken, _sizeDelta);
        position.reserveAmount = position.reserveAmount.add(reserveDelta);
        _increaseReservedAmount(_collateralToken, reserveDelta);
        if (_isLong) {
            _increaseGuaranteedUsd(_collateralToken, _sizeDelta.add(fee));
            _decreaseGuaranteedUsd(_collateralToken, collateralDeltaUsd);
            _increasePoolAmount(_collateralToken, collateralDelta);
            _decreasePoolAmount(_collateralToken, usdToTokenMin(_collateralToken, fee));
        } else {
            if (globalShortSizes[_indexToken] == 0) {
                globalShortAveragePrices[_indexToken] = price;
            } else {
                globalShortAveragePrices[_indexToken] = getNextGlobalShortAveragePrice(_indexToken, price, _sizeDelta);
            }

            _increaseGlobalShortSize(_indexToken, _sizeDelta);
        }
        emit Events.IncreasePosition(key, _account, _collateralToken, _indexToken, collateralDeltaUsd, _sizeDelta, _isLong, price, fee);
        emit Events.UpdatePosition(key, position.size, position.collateral, position.averagePrice, position.entryFundingRate, position.reserveAmount, position.realisedPnl, price);
    }
    function decreasePosition(address _account, address _collateralToken, address _indexToken, uint256 _collateralDelta, uint256 _sizeDelta, bool _isLong, address _receiver) external override nonReentrant returns (uint256) {
        _validateGasPrice();
        _validateRouter(_account);
        return _decreasePosition(_account, _collateralToken, _indexToken, _collateralDelta, _sizeDelta, _isLong, _receiver);
    }
    function liquidatePosition(address _account, address _collateralToken, address _indexToken, bool _isLong, address _feeReceiver) external override nonReentrant {
        if (inPrivateLiquidationMode) {
            _validate(isLiquidator[msg.sender], 34);
        }
        includeAmmPrice = false;
        updateCumulativeFundingRate(_collateralToken, _indexToken);
        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
        DataTypes.Position memory position = positions[key];
        _validate(position.size > 0, 35);
        (uint256 liquidationState, uint256 marginFees) = validateLiquidation(_account, _collateralToken, _indexToken, _isLong, false);
        _validate(liquidationState != 0, 36);
        if (liquidationState == 2) {
            _decreasePosition(_account, _collateralToken, _indexToken, 0, position.size, _isLong, _account);
            includeAmmPrice = true;
            return;
        }
        uint256 feeTokens = usdToTokenMin(_collateralToken, marginFees);
        feeReserves[_collateralToken] = feeReserves[_collateralToken].add(feeTokens);
        emit Events.CollectMarginFees(_collateralToken, marginFees, feeTokens);
        _decreaseReservedAmount(_collateralToken, position.reserveAmount);

        if (_isLong) {
            _decreaseGuaranteedUsd(_collateralToken, position.size.sub(position.collateral));
            _decreasePoolAmount(_collateralToken, usdToTokenMin(_collateralToken, marginFees));
        }
        uint256 markPrice = _isLong ? getMinPrice(_indexToken) : getMaxPrice(_indexToken);
        emit Events.LiquidatePosition(key, _account, _collateralToken, _indexToken, _isLong, position.size, position.collateral, position.reserveAmount, position.realisedPnl, markPrice);
        if (!_isLong && marginFees < position.collateral) {
            uint256 remainingCollateral = position.collateral.sub(marginFees);
            _increasePoolAmount(_collateralToken, usdToTokenMin(_collateralToken, remainingCollateral));
        }
        if (!_isLong) {
            _decreaseGlobalShortSize(_indexToken, position.size);
        }
        delete positions[key];
        _decreasePoolAmount(_collateralToken, usdToTokenMin(_collateralToken, liquidationFeeUsd));
        _transferOut(_collateralToken, usdToTokenMin(_collateralToken, liquidationFeeUsd), _feeReceiver);
        includeAmmPrice = true;
    }
    function updateCumulativeFundingRate(address _collateralToken, address _indexToken) public {
        bool shouldUpdate = vaultUtils.updateCumulativeFundingRate(_collateralToken, _indexToken);
        if (!shouldUpdate) {
            return;
        }
        if (lastFundingTimes[_collateralToken] == 0) {
            lastFundingTimes[_collateralToken] = block.timestamp.div(fundingInterval).mul(fundingInterval);
            return;
        }
        if (lastFundingTimes[_collateralToken].add(fundingInterval) > block.timestamp) {
            return;
        }
        uint256 fundingRate = getNextFundingRate(_collateralToken);
        cumulativeFundingRates[_collateralToken] = cumulativeFundingRates[_collateralToken].add(fundingRate);
        lastFundingTimes[_collateralToken] = block.timestamp.div(fundingInterval).mul(fundingInterval);
        emit Events.UpdateFundingRate(_collateralToken, cumulativeFundingRates[_collateralToken]);
    }
    function _decreasePosition(address _account, address _collateralToken, address _indexToken, uint256 _collateralDelta, uint256 _sizeDelta, bool _isLong, address _receiver) internal returns (uint256) {
        vaultUtils.validateDecreasePosition(_account, _collateralToken, _indexToken, _collateralDelta, _sizeDelta, _isLong, _receiver);
        updateCumulativeFundingRate(_collateralToken, _indexToken);
        bytes32 key = getPositionKey(_account, _collateralToken, _indexToken, _isLong);
        DataTypes.Position storage position = positions[key];
        _validate(position.size > 0, 31);
        _validate(position.size >= _sizeDelta, 32);
        _validate(position.collateral >= _collateralDelta, 33);

        uint256 collateral = position.collateral;
        {
            uint256 reserveDelta = position.reserveAmount.mul(_sizeDelta).div(position.size);
            position.reserveAmount = position.reserveAmount.sub(reserveDelta);
            _decreaseReservedAmount(_collateralToken, reserveDelta);
        }
        (uint256 usdOut, uint256 usdOutAfterFee) = _reduceCollateral(_account, _collateralToken, _indexToken, _collateralDelta, _sizeDelta, _isLong);
        if (position.size != _sizeDelta) {
            position.entryFundingRate = getEntryFundingRate(_collateralToken, _indexToken, _isLong);
            position.size = position.size.sub(_sizeDelta);
            _validatePosition(position.size, position.collateral);
            validateLiquidation(_account, _collateralToken, _indexToken, _isLong, true);
            if (_isLong) {
                _increaseGuaranteedUsd(_collateralToken, collateral.sub(position.collateral));
                _decreaseGuaranteedUsd(_collateralToken, _sizeDelta);
            }
            uint256 price = _isLong ? getMinPrice(_indexToken) : getMaxPrice(_indexToken);
            emit Events.DecreasePosition(key, _account, _collateralToken, _indexToken, _collateralDelta, _sizeDelta, _isLong, price, usdOut.sub(usdOutAfterFee));
            emit Events.UpdatePosition(key, position.size, position.collateral, position.averagePrice, position.entryFundingRate, position.reserveAmount, position.realisedPnl, price);
        } else {
            if (_isLong) {
                _increaseGuaranteedUsd(_collateralToken, collateral);
                _decreaseGuaranteedUsd(_collateralToken, _sizeDelta);
            }
            uint256 price = _isLong ? getMinPrice(_indexToken) : getMaxPrice(_indexToken);
            emit Events.DecreasePosition(key, _account, _collateralToken, _indexToken, _collateralDelta, _sizeDelta, _isLong, price, usdOut.sub(usdOutAfterFee));
            emit Events.ClosePosition(key, position.size, position.collateral, position.averagePrice, position.entryFundingRate, position.reserveAmount, position.realisedPnl);
            delete positions[key];
        }
        if (!_isLong) {
            _decreaseGlobalShortSize(_indexToken, _sizeDelta);
        }
        if (usdOut > 0) {
            if (_isLong) {
                _decreasePoolAmount(_collateralToken, usdToTokenMin(_collateralToken, usdOut));
            }
            uint256 amountOutAfterFees = usdToTokenMin(_collateralToken, usdOutAfterFee);
            _transferOut(_collateralToken, amountOutAfterFees, _receiver);
            return amountOutAfterFees;
        }
        return 0;
    }
}

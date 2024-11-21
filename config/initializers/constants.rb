# frozen_string_literal: true

# ----------------
# ORDER
# ----------------
STANDARD_WAIT_TIME = 5
ORDER_STATUSES = { initiated: 0, in_progress: 1, ready: 2, completed: 2 }.freeze

# ----------------
# ITEM
# ----------------
ITEM_DISCOUNT_RATES = [0, 0.5, 1.0]
ITEM_CATEGORIES = { beverage: 0, food: 1, merchandise: 2 }.freeze

# ----------------
# RESPONSE STATUS CODES
# ----------------
RESPONSE_STATUS_CODES = Rack::Utils::SYMBOL_TO_STATUS_CODE

# ----------------
# For Pagination
# ----------------
DEFAULT_PAGE = 1
PER_PAGE_RECORDS = 10

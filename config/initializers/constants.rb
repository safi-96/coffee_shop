# frozen_string_literal: true

# ----------------
# ORDER
# ----------------
STANDARD_WAIT_TIME = 5
ORDER_STATUSES = { initiated: 0, ready: 2 }.freeze

# ----------------
# ITEM
# ----------------
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

# Discount Rules
# 1. Buy 2 food item and get 1 bevarage at 50%
# 2. Buy 2 bevarages get 1 merchandise free

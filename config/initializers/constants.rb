# frozen_string_literal: true

# ----------------
# ORDER
# ----------------
STANDARD_WAIT_TIME = 5
ORDER_STATUSES = { initiated: 0, paid: 1, ready: 2 }.freeze

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
# 1. Buy 2 of the same item, get a 10% discount on the third one.
# 2. Buy 3 of the same item, get the last one for free.

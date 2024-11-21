# frozen_string_literal: true

# ----------------
# ORDER
# ----------------
STANDARD_WAIT_TIME = 5

# ----------------
# ITEM
# ----------------
ITEM_DISCOUNT_RATES = [0, 0.5, 1.0]
ITEM_CATEGORIES = { beverage: 0, food: 1, merchandise: 2 }.freeze

# ----------------
# RESPONSE STATUS CODES
# ----------------
RESPONSE_STATUS_CODES = Rack::Utils::SYMBOL_TO_STATUS_CODE

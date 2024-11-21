# frozen_string_literal: true

require 'pagy/extras/overflow'

module Paginator
  extend ActiveSupport::Concern

  include Pagy::Backend

  def paginate(collection)
    @pagy, result = pagy(collection, page: params[:page] || DEFAULT_PAGE, items: params[:perPage] || PER_PAGE_RECORDS)
    result
  end
end

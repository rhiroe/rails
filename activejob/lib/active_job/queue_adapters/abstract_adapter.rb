# frozen_string_literal: true

module ActiveJob
  module QueueAdapters
    # = Active Job Abstract Adapter
    #
    # Active Job supports multiple job queue systems. ActiveJob::QueueAdapters::AbstractAdapter
    # form the abstraction layer which makes this possible.
    class AbstractAdapter
      # Define whether enqueuing should implictly to after commit when called from
      # inside a transaction. Most adapters should return true, but some adapters
      # that use the same database as Active Record and are transaction aware can return
      # false to continue enqueuing jobs are part of the transaction.
      def enqueue_after_transaction_commit?
        true
      end

      def enqueue(job)
        raise NotImplementedError
      end

      def enqueue_at(job, timestamp)
        raise NotImplementedError
      end
    end
  end
end

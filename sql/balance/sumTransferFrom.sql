SELECT
    lower({address: String}) as address,
    lower({tick: String}) as tick,
    from,
    sum(amt) as amt,
    count(*) transactions,
    last_value(block_number) as last_block_number
FROM transfer
WHERE id IN (SELECT id FROM approve_transfer WHERE approve_transfer.id = id) AND
transfer.from = address AND
block_number <= {block_number: UInt32}
GROUP BY (from, tick)
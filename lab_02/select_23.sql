with RECURSIVE tCTE(pk, name, parent_id, level) as (
    select pk, name, parent_id, 0
    from bookmakers
    where parent_id is null
    union all
    select  b.pk, b.name, b.parent_id, tCTE.level + 1
    from bookmakers b JOIN tCTE on b.parent_id = tCTE.pk
)
select * from tCTE
where level > 1;

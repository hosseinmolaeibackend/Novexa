/* trigger*/

Create trigger trg_afterInsertProduct
on [dbo].products
After insert
as
begin
select * from products
end;

create trigger trg_afterUpdateCustomers
on [dbo].customers
After Update
as
begin
Insert into customers_logs(opertions,oldFirstName,newFirstName,oldEmail,newEmail,oldregion,newregion)
 SELECT
        'UPDATE',
        d.FirstName,
        i.FirstName,
        d.Email,
        i.Email,
        d.Region,
        i.Region
    FROM deleted d
    JOIN inserted i ON d.Id = i.Id
END
--вывести клиентов и суммы их счетов, если могут быть клиенты без счета и их тоже нужно включить в список, то будет LEFT JOIN
WITH cte as (
    SELECT c.client_id, SUM(c.sum_balance) as summa
    FROM account as a
    LEFT JOIN  card  as c on a.id=c.account_id and a.client_id=c.client_id
    GROUP BY c.client_id
)
SELECT (c.last_name||' '||substring(upper(c.first_name),1,1)||'.'||' '||substring(upper(c.surname),1,1)||'.') as FIO,
       coalesce(t.summa,0) as sum_accounts
FROM client as c
JOIN cte as t on t.client_id=c.id
;
-------------------пополнение карты---------------------
CREATE OR REPLACE PROCEDURE payment_add(recipient_card_num char(16),fio_sender varchar(50), summa numeric (15,2), type_payment varchar(30), date_from_at date, payment_description text)
language plpgsql
as $$
    declare
        created_at_op timestamp;
        sum_balance_new numeric(15,2);
    begin
                INSERT INTO card_operation (department_id, client_id, account_id, card_id, type_operation
                , sum_operation, sum_balance_prev, sum_balance, description, date_from, date_to, created_at)
                SELECT c.department_id, c.client_id, c.account_id, c.id, 'Дебет', summa, c.sum_balance, (c.sum_balance+summa), payment_description, date_from_at, CURRENT_DATE, now()
                FROM card as c
                WHERE c.card_num=recipient_card_num
                returning created_at , sum_balance into created_at_op,sum_balance_new;

                UPDATE card
                SET
                    updated_at=created_at_op,
                    sum_balance=sum_balance_new
                WHERE recipient_card_num=card_num;

    commit;

    end;
$$;
----------------перевод средств между картами---------------
CREATE OR REPLACE PROCEDURE payment_transfer(sender_card_num char(16), recipient_card_num char(16),fio_sender varchar(50), summa numeric (15,2), type_payment varchar(30), date_from_at date, payment_description text)
language plpgsql
as $$
    declare date_to_sender date;
            sum_balance_sender_new numeric(15,2);
            date_to_recipient date;
            sum_balance_recipient_new numeric(15,2);
    begin

        INSERT INTO card_operation (department_id, client_id, account_id, card_id, type_operation
        , sum_operation, sum_balance_prev, sum_balance, description, date_from, date_to,created_at)
        SELECT c.department_id, c.client_id,c.account_id, c.id, 'Кредит', summa, c.sum_balance, (c.sum_balance-summa), payment_description, date_from_at, CURRENT_DATE,now()
        FROM card as c
        WHERE c.card_num=sender_card_num
        returning date_to,sum_balance into date_to_sender,sum_balance_sender_new;

        UPDATE card
                SET
                    updated_at=date_to_sender,
                    sum_balance=sum_balance_sender_new
                WHERE sender_card_num=card_num;
--вставить апдейт
        INSERT INTO card_operation (department_id, client_id, account_id, card_id, type_operation
        , sum_operation, sum_balance_prev, sum_balance, description, date_from, date_to,created_at)
        SELECT c.department_id, c.client_id,c.account_id, c.id, 'Дебет', summa, c.sum_balance, (c.sum_balance+summa), payment_description, date_to_sender, CURRENT_DATE,now()
        FROM card as c
        WHERE c.card_num=recipient_card_num
        returning date_to, sum_balance into date_to_recipient,sum_balance_recipient_new;

        UPDATE card
                SET
                    updated_at=date_to_recipient,
                    sum_balance=sum_balance_recipient_new
                WHERE recipient_card_num=card_num;

        commit;
    end;
$$;
-------оплата-------
CREATE OR REPLACE PROCEDURE payment_orders(recipient_card_num char(16),fio_sender varchar(50), summa numeric (15,2), type_payment varchar(30), date_from_at date, payment_description text)
--рассматриваю только физ Лиц поэтому нет получателя оплаты товара и т.п.
language plpgsql
as $$
    declare
        created_at_op timestamp;
        sum_balance_new numeric(15,2);
    begin
        --if (type_payment in ('Пополнение','Зачисление'))  then
            --условия можно масштабировать
                INSERT INTO card_operation (department_id, client_id, account_id, card_id, type_operation
                    , sum_operation, sum_balance_prev, sum_balance, description, date_from, date_to,created_at)
                SELECT c.department_id, c.client_id, c.account_id, c.id, 'Кредит', summa, c.sum_balance, (c.sum_balance-summa), payment_description, date_from_at, CURRENT_DATE,now()
                FROM card as c
                WHERE c.card_num=recipient_card_num;

                UPDATE card
                SET
                    updated_at=created_at_op,
                    sum_balance=sum_balance_new
                WHERE recipient_card_num=card_num;

    commit;

    end;
$$;
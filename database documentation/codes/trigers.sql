DELIMETER //

create trigger trg_validar_nota
before insert on notas
for each row
begin
 if new.nota < 0
  or new.nota > 10 then
signal sqlstate '45000'
set message_text='Nota invalida';
  end if;
end//

DELIMITER;

USE paginaWEB;

DROP TRIGGER IF EXISTS before_delete_all_tables;

DELIMITER //

-- Trigger pentru ștergerea în cascada din toate tabelele asociate cu dateUser
CREATE TRIGGER before_delete_all_tables 
BEFORE DELETE ON dateUser
FOR EACH ROW
BEGIN
    -- Șterge din tabela rezervariGhid
    DELETE FROM rezervariGhid WHERE idUser = OLD.user_id;

    -- Șterge din tabela serviciuGhid
    DELETE FROM serviciuGhid WHERE idGhid IN (SELECT ghid_id FROM rezervariGhid WHERE idUser = OLD.user_id);

    -- Șterge din tabela traseeGhid
    DELETE FROM traseeGhid WHERE idGhid IN (SELECT ghid_id FROM rezervariGhid WHERE idUser = OLD.user_id);

    -- Șterge din tabela rezervariRest
    DELETE FROM rezervariRest WHERE idUser = OLD.user_id;

    -- Șterge din tabela oreFunctionareRestaurant
    DELETE FROM oreFunctionareRestaurant WHERE idRest IN (SELECT restaurant_id FROM rezervariRest WHERE idUser = OLD.user_id);

    -- Șterge din tabela rezervareCamera
    DELETE FROM rezervareCamera WHERE idUser = OLD.user_id;

    -- Șterge din tabela rezervareParcare
    DELETE FROM rezervareParcare WHERE idUser = OLD.user_id;

    -- Șterge din tabela rezervariTeren
    DELETE FROM rezervariTeren WHERE idUser = OLD.user_id;

    -- Șterge din tabela terenSala
    DELETE FROM terenSala WHERE idUser = OLD.user_id;
END //
COMMIT; -- finalizează tranzacția pentru trigger-ul before_delete_all_tables

-- Resetăm delimiter-ul la valoarea implicită
DELIMITER ;

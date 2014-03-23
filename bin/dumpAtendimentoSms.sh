mysqldump -u root -proot --extended-insert=false --complete-insert --no-create-db --no-create-info atendimentosms user > user.sql
mysqldump -u root -proot --extended-insert=false --complete-insert --no-create-db --no-create-info atendimentosms contact > contact.sql
mysqldump -u root -proot --extended-insert=false --complete-insert --no-create-db --no-create-info atendimentosms spam_numbers > spam_numbers.sql
mysqldump -u root -proot --extended-insert=false --complete-insert --no-create-db --no-create-info atendimentosms spam_messages > spam_messages.sql

-- * Escreva uma query que exiba o maior salário da tabela.

SELECT MAX(SALARY) FROM hr.employees;

-- * Escreva uma query que exiba a diferença entre o maior e o menor salário.

SELECT MAX(SALARY) - MIN(SALARY) FROM hr.employees;

-- * Escreva uma query que exiba a média salarial de cada JOB_ID , ordenando pela média salarial em ordem decrescente.

SELECT JOB_ID, AVG(SALARY) as media
FROM hr.employees
GROUP BY JOB_ID
ORDER BY media DESC;

-- * Escreva uma query que exiba a quantidade de dinheiro necessária para realizar o pagamento de todas as pessoas funcionárias.

SELECT SUM(SALARY) FROM hr.employees;

-- * Escreva uma query que exiba quatro informações: o maior salário, o menor salário, a soma de todos os salários e a média dos Todos os valores devem ser formatados para ter apenas duas casas decimais.

SELECT ROUND(MAX(SALARY), 2), ROUND(MIN(SALARY), 2), ROUND(SUM(SALARY), 2), ROUND(AVG(SALARY), 2) FROM hr.employees;

-- * Escreva uma query que exiba a quantidade de pessoas que trabalham como pessoas programadoras ( IT_PROG );

SELECT COUNT(JOB_ID) from hr.employees
WHERE JOB_ID = 'IT_PROG';

-- * Escreva uma query que exiba a quantidade de dinheiro necessária para efetuar o pagamento de cada profissão ( JOB_ID );

SELECT JOB_ID, ROUND(AVG(SALARY), 2) as `average_salary` from hr.employees
GROUP BY JOB_ID
ORDER BY `average_salary` DESC;

--  * Utilizando a query anterior, faça as alterações para que seja exibido somente a quantidade de dinheiro necessária para cobrir a folha de pagamento das pessoas programadoras ( IT_PROG ).

SELECT JOB_ID, ROUND(AVG(SALARY), 2) as `average_salary` from hr.employees
GROUP BY JOB_ID HAVING JOB_ID = 'IT_PROG';

-- * Escreva uma query que exiba em ordem decrescente a média salarial de todos os cargos, exceto das pessoas programadoras ( IT_PROG ).

SELECT JOB_ID, ROUND(AVG(SALARY), 2) as `average_salary` from hr.employees
GROUP BY JOB_ID HAVING JOB_ID <> 'IT_PROG'
ORDER BY `average_salary` DESC;

-- * Escreva um query que exiba média salarial e o número de funcionários de todos os departamentos com mais de dez Dica: agrupe pelo department_id .

SELECT ROUND(AVG(SALARY), 2), COUNT(*) as count FROM hr.employees
GROUP BY DEPARTMENT_ID
HAVING count > 10;

-- * Escreva uma query que atualize a coluna PHONE_NUMBER , de modo que todos os telefones iniciados por 515 agora devem iniciarm 777 .

select * from hr.employees;
UPDATE hr.employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, 515, 777)
WHERE PHONE_NUMBER LIKE '515%';

-- * Escreva uma query que só exiba as informações dos funcionários cujo o primeiro nome tenha oito ou mais

SELECT FIRST_NAME, LENGTH(FIRST_NAME) from hr.employees
where LENGTH(FIRST_NAME) >= 8;

-- * Escreva uma query que exiba as seguintes informações de cada funcionário: id , primeiro nome e ano no qual foi contratado (exiba somente o ano).

select * from hr.employees;

select EMPLOYEE_ID,
  FIRST_NAME,
  DAY(HIRE_DATE)
 from hr.employees;

-- * Escreva uma query que exiba as seguintes informações de cada funcionário: id , primeiro nome e dia do mês no qual foi contratado (exiba somente o dia).

select EMPLOYEE_ID,
  FIRST_NAME,
  MONTH(HIRE_DATE)
 from hr.employees;

-- * Escreva uma query que exiba as seguintes informações de cada funcionário: id , primeiro nome e mês no qual foi contratado (exiba somente o mês).

select EMPLOYEE_ID,
  FIRST_NAME,
  MONTH(HIRE_DATE)
 from hr.employees;

-- * Escreva uma query que exiba os nomes dos funcionários em letra maiúscula.

select UCASE(FIRST_NAME)
from hr.employees;


-- * Escreva uma query que exiba o sobrenome e a data de contratação de todos os funcionário contratados em julho de 1987.

select LAST_NAME, HIRE_DATE
from hr.employees
WHERE HIRE_DATE  BETWEEN '1987-07-01'  AND '1987-07-31';

-- * Escreva uma query que exiba as seguintes informações de cada funcionário: nome , sobrenome , tempo que trabalha na empresa (em dias) .

select FIRST_NAME,
  LAST_NAME,
  DateDIFF(CURRENT_DATE(), HIRE_DATE)
from hr.employees;


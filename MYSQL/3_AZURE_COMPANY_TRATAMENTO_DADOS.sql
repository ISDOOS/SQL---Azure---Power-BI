-- Verifique se há algum colaborador sem gerente
SELECT E.Fname, E.Lname
FROM employee AS E
WHERE E.Super_ssn IS NULL;

-- Verifique se há algum departamento sem gerente
SELECT D.Dname
FROM departament AS D
LEFT JOIN employee AS E ON D.Mgr_ssn = E.Ssn
WHERE E.Ssn IS NULL;

-- Se houver departamento sem gerente, suponha que você possui os dados e preencha as lacunas
UPDATE departament
SET Mgr_ssn = 'NovoGerenteSsn'
WHERE Mgr_ssn IS NULL;
-- Certifique-se de definir 'NovoGerenteSsn' para um valor real.

-- Verifique o número de horas dos projetos
SELECT P.Pname, SUM(W.Hours)
FROM project AS P
JOIN works_on AS W ON P.Pnumber = W.Pno
GROUP BY P.Pname;

-- Mesclar consultas employee e departament para criar uma tabela employee com o nome dos departamentos associados aos colaboradores
CREATE TABLE employee_with_departments AS
SELECT E.*, D.Dname AS DepartmentName
FROM employee AS E
LEFT JOIN departament AS D ON E.Dno = D.Dnumber;

-- Realize a junção dos colaboradores e respectivos nomes dos gerentes
SELECT E.*, M.Fname AS ManagerFirstName, M.Lname AS ManagerLastName
FROM employee_with_departments AS E
LEFT JOIN employee AS M ON E.Super_ssn = M.Ssn;

-- Mescle as colunas de Nome e Sobrenome
SELECT E.*, CONCAT(E.Fname, ' ', E.Lname) AS FullName
FROM employee_with_departments AS E;

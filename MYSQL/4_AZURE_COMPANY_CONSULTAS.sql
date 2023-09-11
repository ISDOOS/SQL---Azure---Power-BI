-- Consulta 1: Listar todos os funcionários
select * from employee;

-- Consulta 2: Listar todos os projetos
select * from project;

-- Consulta 3: Listar todos os departamentos
select * from departament;

-- Consulta 4: Listar todos os dependentes
select * from dependent;

-- Consulta 5: Listar todos os registros da tabela "works_on"
select * from works_on;

-- Consulta 6: Listar os projetos em que um funcionário específico trabalha
select Pname, Hours
from works_on w
inner join project p on w.Pno = p.Pnumber
where Essn = '123456789';

-- Consulta 7: Listar os funcionários que não possuem supervisor
select Fname, Lname
from employee
where Super_ssn is null;

-- Consulta 8: Listar os projetos em um departamento específico
select Pname, Plocation
from project p
inner join departament d on p.Dnum = d.Dnumber
where Dname = 'Research';

-- Consulta 9: Listar os dependentes de um funcionário específico
select Dependent_name, Relationship
from dependent
where Essn = '333445555';

-- Consulta 10: Listar os funcionários que ganham mais de $40,000 por ano
select Fname, Lname, Salary
from employee
where Salary > 40000;

-- Consulta 11: Listar os funcionários do departamento de "Headquarters"
select Fname, Lname
from employee e
inner join departament d on e.Dno = d.Dnumber
where Dname = 'Headquarters';

-- Consulta 12: Listar os projetos com mais de 20 horas de trabalho
select Pname, Hours
from works_on w
inner join project p on w.Pno = p.Pnumber
where Hours > 20;

-- Consulta 13: Listar os dependentes que são filhos
select Dependent_name, Sex
from dependent
where Relationship = 'Son' or Relationship = 'Daughter';

-- Consulta 14: Listar os projetos localizados em "Houston"
select Pname, Plocation
from project
where Plocation = 'Houston';

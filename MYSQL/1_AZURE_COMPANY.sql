-- Criar o esquema "azure_company" se ele não existir
create schema if not exists azure_company;

-- Usar o esquema "azure_company"
use azure_company;

-- Tabela que armazena informações sobre restrições de tabela
-- Esta consulta recupera informações sobre as restrições de tabela no esquema "azure_company"
select * from information_schema.table_constraints
	where constraint_schema = 'azure_company';

-- Tabela "employee" para armazenar informações de funcionários
-- Esta parte cria a tabela "employee" para armazenar informações sobre funcionários
CREATE TABLE employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null, 
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    constraint chk_salary_employee check (Salary> 2000.0),
    constraint pk_employee primary key (Ssn)
);

-- Adicionar chave estrangeira à tabela "employee"
-- Esta parte adiciona uma chave estrangeira à tabela "employee" referenciando a si mesma
-- para representar a hierarquia de supervisão entre os funcionários
alter table employee 
	add constraint fk_employee 
	foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

-- Modificar a coluna "Dno" na tabela "employee"
-- Esta parte modifica a coluna "Dno" para garantir que ela não seja nula e tenha um valor padrão de 1
alter table employee modify Dno int not null default 1;

-- Descrição da tabela "employee"
-- Esta consulta fornece informações sobre a estrutura da tabela "employee"
desc employee;

-- Tabela "departament" para armazenar informações sobre departamentos
-- Esta parte cria a tabela "departament" para armazenar informações sobre departamentos
create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique(Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

-- Modificar uma constraint na tabela "departament"
-- drop e add
-- Esta parte modifica uma restrição existente na tabela "departament" relacionada à chave estrangeira do gerente (Mgr_ssn)
alter table departament 
		add constraint fk_deptament foreign key(Mgr_ssn) references employee(Ssn)
        on update cascade;

-- Descrição da tabela "departament"
-- Esta consulta fornece informações sobre a estrutura da tabela "departament"
desc departament;

-- Tabela "dept_locations" para armazenar informações sobre a localização dos departamentos
-- Esta parte cria a tabela "dept_locations" para armazenar informações sobre a localização dos departamentos
create table dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);

-- Remover uma chave estrangeira na tabela "dept_locations"
-- (Nenhuma ação de remoção, pois não é mais necessária)
-- alter table dept_locations drop fk_dept_locations;

-- Adicionar uma chave estrangeira à tabela "dept_locations"
-- Esta parte adiciona uma chave estrangeira à tabela "dept_locations" relacionada ao departamento
alter table dept_locations 
	add constraint fk_dept_locations2 foreign key (Dnumber) references departament(Dnumber)
	on delete cascade
    on update cascade;

-- Tabela "project" para armazenar informações sobre projetos
-- Esta parte cria a tabela "project" para armazenar informações sobre projetos
create table project(
	Pname varchar(15) not null,
	Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

-- Tabela "works_on" para rastrear o trabalho dos funcionários em projetos
-- Esta parte cria a tabela "works_on" para rastrear o trabalho dos funcionários em projetos
create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_project_works_on foreign key (Pno) references project(Pnumber)
);

-- Tabela "dependent" para armazenar informações sobre dependentes de funcionários
-- Esta parte cria a tabela "dependent" para armazenar informações sobre dependentes de funcionários
create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);
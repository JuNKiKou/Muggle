drop table if exists User;
create table User(
	u_id char(16) primary key not null,
	u_telephone char(11) unique not null,
	u_admin bit not null default b'0',
	u_password char(16) not null,
	u_header text,
	u_nick_name varchar(100) not null,
	u_sex bit,
	u_age int,
	u_place int
)charset=utf8;

drop table if exists Question;
create table Question(
	q_id char(16) primary key not null,
	q_type int not null,
	q_rank int not null,
	q_key char(16) not null,
	q_content text not null,
	q_tag int,
	q_exam char(16),
	q_number varchar(10),
	q_radio char(16)
)charset=utf8;


drop table if exists Examination;
create table Examination(
	e_id char(16) primary key not null,
	e_type int not null,
	e_rank int not null,
	e_path char(16) not null,
	e_keys char(16),
	e_radio char(16) 
)charset=utf8;

drop table if exists Answer;
create table Answer(
	a_id char(16) primary key not null,
	a_content text not null
)charset=utf8;


drop table if exists ExaminationResource;
create table ExaminationResource(
	er_id char(16) primary key not null,
	er_name varchar(50) not null,
	er_path text,
	er_volidate char(16)
)charset=utf8;

drop table if exists KeyResource;
create table KeyResource(
	kr_id char(16) primary key not null,
	kr_name varchar(50) not null,
	kr_path text,
	kr_volidate char(16)
)charset=utf8;

drop table if exists RadioResource;
create table RadioResource(
	rr_id char(16) primary key not null,
	rr_name varchar(50) not null,
	rr_path text,
	rr_volidate char(16)
)charset=utf8;

drop table if exists Type;
create table Type(
	t_id int primary key not null,
	t_name varchar(50) not null
)charset=utf8;


drop table if exists Rank;
create table Rank(
	id int primary key not null,
	name varchar(50) not null
)charset=utf8;

drop table if exists Tag;
create table Tag(
	tag_id int primary key not null,
	tag_name varchar(50) not null
)charset=utf8;

drop table if exists Place;
create table Place(
	p_id int primary key not null,
	p_name varchar(50) not null
)charset=utf8;




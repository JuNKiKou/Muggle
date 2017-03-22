drop table if exists QuestionCollection;
create table QuestionCollection(
	qc_id char(16) primary key not null,
	qc_user char(16) not null,
	qc_question char(16) not null,
	qc_date date not null,
	qc_status bit not null
)charset=utf8;


drop table if exists ExaminationCollection;
create table ExaminationCollection(
	ec_id char(16) primary key not null,
	ec_user char(16) not null,
	ec_exam char(16) not null,
	ec_date date not null,
	ec_status bit not null
)charset=utf8;


drop table if exists QuestionVisit;
create table QuestionVisit(
	qv_id char(16) primary key not null,
	qv_user char(16) not null,
	qv_question char(16) not null,
	qv_time time not null
)charset=utf8;


drop table if exists ExaminationVisit;
create table ExaminationVisit(
	ev_id char(16) primary key not null,
	ev_user char(16) not null,
	ev_exam char(16) not null,
	ev_time time not null
)charset=utf8;


drop table if exists QuestionStar;
create table QuestionStar(
	qs_id char(16) primary key not null,
	qs_user char(16) not null,
	qs_question char(16) not null,
	qs_date date not null,
	qs_value double not null
)charset=utf8;

drop table if exists ExaminationStar;
create table ExaminationStar(
	es_id char(16) primary key not null,
	es_user char(16) not null,
	es_exam char(16) not null,
	es_date date not null,
	es_value double not null
)charset=utf8;


drop table if exists ExaminationDownload;
create table ExaminationDownload(
	ed_id char(16) primary key not null,
	ed_user char(16) not null,
	ed_exam char(16) not null,
	ed_date date not null
)charset=utf8;


drop table if exists UserStudyStatus;
create table UserStudyStatus(
	id char(16) primary key not null,
	user char(16) not null,
	rank int not null,
	time date not null,
	rate double not null
)charset=utf8;

drop table if exists Advice;	
create table Advice(
	id char(16) primary key not null,
	user char(16) not null,
	content text not null,
	time date not null
)charset=utf8;
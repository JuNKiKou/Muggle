alter table User
add constraint FK_user_place foreign key(u_place) references Place(p_id);


alter table Question
add constraint FK_question_type foreign key(q_type) references Type(t_id);


alter table Question
add constraint FK_question_rank foreign key(q_rank) references Rank(id);

alter table Question
add constraint FK_question_key foreign key(q_key) references Answer(a_id);

alter table Question
add constraint FK_question_tag foreign key(q_tag) references Tag(tag_id);

alter table Question
add constraint FK_question_exam foreign key(q_exam) references Examination(e_id);

alter table Examination
add constraint FK_exam_type foreign key(e_type) references Type(t_id);

alter table Examination
add constraint FK_exam_rank foreign key(e_rank) references Rank(id);

alter table Examination
add constraint FK_exam_path foreign key(e_path) references ExaminationResource(er_id);

alter table Examination
add constraint FK_exam_keys foreign key(e_keys) references KeyResource(kr_id);

alter table Examination
add constraint FK_exam_radio foreign key(e_radio) references RadioResource(rr_id);

alter table QuestionCollection
add constraint FK_qc_user foreign key(qc_user) references User(u_id);

alter table QuestionCollection
add constraint FK_qc_question foreign key(qc_question) references Question(q_id);

alter table ExaminationCollection
add constraint FK_ec_user foreign key(ec_user) references User(u_id);

alter table ExaminationCollection
add constraint FK_ec_exam foreign key(ec_exam) references Examination(e_id);

alter table QuestionVisit
add constraint FK_qv_user foreign key(qv_user) references User(u_id);

alter table QuestionVisit
add constraint FK_qv_question foreign key(qv_question) references Question(q_id);

alter table ExaminationVisit
add constraint FK_ev_user foreign key(ev_user) references User(u_id);

alter table ExaminationVisit
add constraint FK_ev_exam foreign key(ev_exam) references Examination(e_id);

alter table QuestionStar
add constraint FK_qs_user foreign key(qs_user) references User(u_id);

alter table QuestionStar
add constraint FK_qs_question foreign key(qs_question) references Question(q_id);

alter table ExaminationStar
add constraint FK_es_user foreign key(es_user) references User(u_id);

alter table ExaminationStar
add constraint FK_es_exam foreign key(es_exam) references Examination(e_id);

alter table ExaminationDownload
add constraint FK_ed_user foreign key(ed_user) references User(u_id);

alter table ExaminationDownload
add constraint FK_ed_exam foreign key(ed_exam) references Examination(e_id);

alter table UserStudyStatus
add constraint FK_status_user foreign key(user) references User(u_id);

alter table UserStudyStatus
add constraint FK_status_rank foreign key(rank) references Rank(id);

alter table Advice
add constraint FK_advice_user foreign key(id) references User(u_id);


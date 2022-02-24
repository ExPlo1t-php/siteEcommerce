/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/02/2022 13:24:22                      */
/*==============================================================*/


drop table if exists Client;

drop table if exists Command;

drop table if exists Produit;

drop table if exists association2;

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   idclient             varchar(254) not null,
   lastname             varchar(254),
   firstname            varchar(254),
   adress               varchar(254),
   numtel               varchar(254),
   email                varchar(254),
   pwd                  varchar(254),
   primary key (idclient)
);

/*==============================================================*/
/* Table : Command                                              */
/*==============================================================*/
create table Command
(
   adressliv            varchar(254),
   product              varchar(254),
   price                int,
   quantitypr           int,
   date                 datetime,
   numcmd               int not null,
   idclient             varchar(254) not null,
   primary key (numcmd)
);

/*==============================================================*/
/* Table : Produit                                              */
/*==============================================================*/
create table Produit
(
   idproduct            varchar(254) not null,
   "label"              varchar(254),
   description          varchar(254),
   priceuni             int,
   quantity             float,
   primary key (idproduct)
);

/*==============================================================*/
/* Table : association2                                         */
/*==============================================================*/
create table association2
(
   numcmd               int not null,
   idproduct            varchar(254) not null,
   qtecommande          int,
   primary key (numcmd, idproduct)
);

alter table Command add constraint FK_passer foreign key (idclient)
      references Client (idclient) on delete restrict on update restrict;

alter table association2 add constraint FK_concerne foreign key (numcmd)
      references Command (numcmd) on delete restrict on update restrict;

alter table association2 add constraint FK_concerne foreign key (idproduct)
      references Produit (idproduct) on delete restrict on update restrict;


-- tip_fisier

create table tip_fisier (
id_tipf varchar2(20) primary key,
denumire varchar2(100),
descriere varchar2(500),
modificat_de varchar2(50),
modificat_la date
);
commit;

create sequence seq_001_tip_fisier
minvalue 10
start with 10
increment by 1
cache 20;
commit;

create or replace trigger trg_001_tip_fisier
before insert on tip_fisier for each row 
begin
select 'TF'||to_char(seq_001_tip_fisier.nextval)
into :new.id_tipf
from dual;
end;
commit;

create or replace trigger trg_002_tip_fisier
before insert or update
on tip_fisier
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_002_tip_fisier;
commit;

create or replace trigger trg_003_tip_fisier
before insert or update
on tip_fisier
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_003_tip_fisier;
commit;

insert into tip_fisier (denumire,descriere) values ('dummy','dummy');
insert into tip_fisier (denumire,descriere) values ('Text Files','Text Files');
insert into tip_fisier (denumire,descriere) values ('Data Files','Data Files');
insert into tip_fisier (denumire,descriere) values ('Audio Files','Audio Files');
insert into tip_fisier (denumire,descriere) values ('Video Files','Video Files');
insert into tip_fisier (denumire,descriere) values ('3D Image Files','3D Image Files');
insert into tip_fisier (denumire,descriere) values ('Raster Image Files','Raster Image Files');
insert into tip_fisier (denumire,descriere) values ('Vector Image Files','Vector Image Files');
insert into tip_fisier (denumire,descriere) values ('Page Layout Files','Page Layout Files');
insert into tip_fisier (denumire,descriere) values ('Spreadsheet Files','Spreadsheet Files');
insert into tip_fisier (denumire,descriere) values ('Database Files','Database Files');
insert into tip_fisier (denumire,descriere) values ('Executable Files','Executable Files');
insert into tip_fisier (denumire,descriere) values ('Game Files','Game Files');
insert into tip_fisier (denumire,descriere) values ('CAD Files','CAD Files');
insert into tip_fisier (denumire,descriere) values ('GIS Files','GIS Files');
insert into tip_fisier (denumire,descriere) values ('Web Files','Web Files');
insert into tip_fisier (denumire,descriere) values ('Plugin Files','Plugin Files');
insert into tip_fisier (denumire,descriere) values ('Font Files','Font Files');
insert into tip_fisier (denumire,descriere) values ('System Files','System Files');
insert into tip_fisier (denumire,descriere) values ('Settings Files','Settings Files');
insert into tip_fisier (denumire,descriere) values ('Encoded Files','Encoded Files');
insert into tip_fisier (denumire,descriere) values ('Compressed Files','Compressed Files');
insert into tip_fisier (denumire,descriere) values ('Disk Image Files','Disk Image Files');
insert into tip_fisier (denumire,descriere) values ('Developer Files','Developer Files');
insert into tip_fisier (denumire,descriere) values ('Backup Files','Backup Files');
insert into tip_fisier (denumire,descriere) values ('Misc Files','Misc Files');
commit;

-- extensie_fisier

create table extensie_fisier (
id_extf varchar2(20) primary key,
tipf varchar2(20),
denumire varchar2(100),
descriere varchar2(500),
modificat_de varchar2(50),
modificat_la date
);
commit;

alter table extensie_fisier add constraint fk_extensie_fisier_tipf foreign key (tipf) references tip_fisier (id_tipf) on delete cascade;
commit;

create sequence seq_001_extensie_fisier
minvalue 100
start with 100
increment by 1
cache 20;
commit;

create or replace trigger trg_001_extensie_fisier
before insert on extensie_fisier for each row 
begin
select 'EXT'||to_char(seq_001_extensie_fisier.nextval)
into :new.id_extf
from dual;
end;
commit;

create or replace trigger trg_002_extensie_fisier
before insert or update
on extensie_fisier
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_002_extensie_fisier;
commit;

create or replace trigger trg_003_extensie_fisier
before insert or update
on extensie_fisier
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_003_extensie_fisier;
commit;

insert into extensie_fisier (tipf,denumire,descriere) values ('TF10','dummy','dummy');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.doc','Microsoft Word Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.docx','Microsoft Word Open XML Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.log','Log File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.msg','Outlook Mail Message');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.pages','Pages Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.rtf','Rich Text Format File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.txt','Plain Text File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.wpd','WordPerfect Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF11','.wps','Microsoft Works Word Processor Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.csv','Comma Separated Values File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.dat','Data File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.efx','eFax Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.key','Keynote Presentation');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.pps','PowerPoint Slide Show');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.ppt','PowerPoint Presentation');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.pptx','PowerPoint Open XML Presentation');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.sdf','Standard Data File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.vcf','vCard File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF12','.xml','XML File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.aif','Audio Interchange File Format');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.iff','Interchange File Format');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.m3u','Media Playlist File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.m4a','MPEG-4 Audio File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.mid','MIDI File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.mp3','MP3 Audio File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.mpa','MPEG-2 Audio File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.ra','Real Audio File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.wav','WAVE Audio File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF13','.wma','Windows Media Audio File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.3g2','3GPP2 Multimedia File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.3gp','3GPP Multimedia File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.asf','Advanced Systems Format File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.asx','Microsoft ASF Redirector File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.avi','Audio Video Interleave File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.flv','Flash Video File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.mov','Apple QuickTime Movie');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.mp4','MPEG-4 Video File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.mpg','MPEG Video File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.rm','Real Media File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.swf','Shockwave Flash Movie');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.vob','DVD Video Object File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF14','.wmv','Windows Media Video File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF15','.3dm','Rhino 3D Model');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF15','.max','3ds Max Scene File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.bmp','Bitmap Image File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.gif','Graphical Interchange Format File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.jpg','JPEG Image File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.png','Portable Network Graphic');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.psd','Adobe Photoshop Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.pspimage','PaintShop Pro Image');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.thm','Thumbnail Image File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.tif','Tagged Image File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF16','.yuv','YUV Encoded Image File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF17','.ai','Adobe Illustrator File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF17','.drw','Drawing File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF17','.eps','Encapsulated PostScript File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF17','.ps','PostScript File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF17','.svg','Scalable Vector Graphics File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF18','.indd','Adobe InDesign Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF18','.pct','Picture File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF18','.pdf','Portable Document Format File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF18','.qxd','QuarkXPress Document');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF18','.qxp','QuarkXPress Project File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF18','.rels','Open Office XML Relationships File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF19','.xlr','Works Spreadsheet');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF19','.xls','Excel Spreadsheet');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF19','.xlsx','Microsoft Excel Open XML Spreadsheet');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.accdb','Access 2007 Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.db','Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.dbf','Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.mdb','Microsoft Access Database');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.pdb','Program Database');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.sql','Structured Query Language Data');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.lst','Structured Query Language Data');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.pls','PLSQL File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.plb','PLSQL File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.pks','PLSQL File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.pkb','PLSQL File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.pck','PLSQL File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.dbf','Oracle Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.log','Oracle Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.rdo','Oracle Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.arc','Oracle Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.ctl','SQL Loader File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.dat','SQL Loader File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.bad','SQL Loader File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.dsc','SQL Loader File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.fmb','Oracle Forms File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.fmt','Oracle Forms File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.fmx','Oracle Forms File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.rdf','Oracle Reports File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.rep','Oracle Reports File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.rex','Oracle Reports File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF20','.pde','PLSQL Developer Dump File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.app','Mac OS X Application');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.bat','DOS Batch File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.cgi','Common Gateway Interface Script');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.com','DOS Command File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.exe','Windows Executable File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.gadget','Windows Gadget');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.jar','Java Archive File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.pif','Program Information File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.vb','VBScript File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF21','.wsf','Windows Script File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF22','.gam','Saved Game File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF22','.nes','Nintendo (NES) ROM File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF22','.rom','N64 Game ROM File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF22','.sav','Saved Game');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF23','.dwg','AutoCAD Drawing Database File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF23','.dxf','Drawing Exchange Format File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF24','.gpx','GPS Exchange File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF24','.kml','Keyhole Markup Language File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.asp','Active Server Page');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.cer','Internet Security Certificate');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.csr','Certificate Signing Request File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.css','Cascading Style Sheet');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.htm','Hypertext Markup Language File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.html','Hypertext Markup Language File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.js','JavaScript File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.jsp','Java Server Page');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.php','Hypertext Preprocessor File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.rss','Rich Site Summary');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF25','.xhtml','Extensible Hypertext Markup Language File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF26','.8bi','Photoshop Plug-in');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF26','.plugin','Mac OS X Plug-in');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF26','.xll','Excel Add-In File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF27','.fnt','Windows Font File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF27','.fon','Generic Font File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF27','.otf','OpenType Font');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF27','.ttf','TrueType Font');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.cab','Windows Cabinet File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.cpl','Windows Control Panel Item');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.cur','Windows Cursor');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.dll','Dynamic Link Library');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.dmp','Windows Memory Dump');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.drv','Device Driver');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.lnk','File Shortcut');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF28','.sys','Windows System File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF29','.cfg','Configuration File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF29','.ini','Windows Initialization File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF29','.keychain','Mac OS X Keychain File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF29','.prf','Outlook Profile File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF30','.bin','Macbinary Encoded File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF30','.hqx','BinHex 4.0 Encoded File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF30','.mim','Multi-Purpose Internet Mail Message File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF30','.uue','Uuencoded File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.7z','7-Zip Compressed File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.deb','Debian Software Package');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.gz','Gnu Zipped Archive');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.pkg','Mac OS X Installer Package');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.rar','WinRAR Compressed Archive');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.rpm','Red Hat Package Manager File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.sit','Stuffit Archive');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.sitx','Stuffit X Archive');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.tar.gz','Tarball File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.zip','Zipped File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF31','.zipx','Extended Zip File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF32','.dmg','Mac OS X Disk Image');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF32','.iso','Disc Image File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF32','.toast','Toast Disc Image');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF32','.vcd','Virtual CD');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.c','C/C++ Source Code File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.class','Java Class File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.cpp','C++ Source Code File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.cs','Visual C# Source Code File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.dtd','Document Type Definition File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.fla','Adobe Flash Animation');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.java','Java Source Code File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.m','Objective-C Implementation File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.pl','Perl Script');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF33','.py','Python Script');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF34','.bak','Backup File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF34','.gho','Norton Ghost Backup File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF34','.ori','Original File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF34','.tmp','Temporary File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF35','.dbx','Outlook Express E-mail Folder');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF35','.msi','Windows Installer Package');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF35','.part','Partially Downloaded File');
insert into extensie_fisier (tipf,denumire,descriere) values ('TF35','.torrent','BitTorrent File');
commit;

-- categorie_media

create table categorie_media (
id_cmedia varchar2(20) primary key,
denumire varchar2(100),
descriere varchar2(500),
modificat_de varchar2(50),
modificat_la date
);
commit;

create sequence seq_001_categorie_media
minvalue 10
start with 10
increment by 1
cache 20;
commit;

create or replace trigger trg_001_categorie_media
before insert on categorie_media for each row 
begin
select 'CM'||to_char(seq_001_categorie_media.nextval)
into :new.id_cmedia
from dual;
end;
commit;

create or replace trigger trg_002_categorie_media
before insert or update
on categorie_media
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_002_categorie_media;
commit;

create or replace trigger trg_003_categorie_media
before insert or update
on categorie_media
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_003_categorie_media;
commit;

insert into categorie_media (denumire,descriere) values ('dummy','dummy');
insert into categorie_media (denumire,descriere) values ('Familia','Familia');
insert into categorie_media (denumire,descriere) values ('Calatorii Concedii','Calatorii Concedii');
insert into categorie_media (denumire,descriere) values ('Diverse','Diverse');
insert into categorie_media (denumire,descriere) values ('Nunti Botezuri LM','Nunti Botezuri LM');
insert into categorie_media (denumire,descriere) values ('Aniversari','Aniversari');
insert into categorie_media (denumire,descriere) values ('Serviciu','Serviciu');
commit;

-- subcategorie_media

create table subcategorie_media (
id_smedia varchar2(20) primary key,
cmedia varchar2(20),
denumire varchar2(100),
descriere varchar2(500),
modificat_de varchar2(50),
modificat_la date
);
commit;

alter table subcategorie_media add constraint fk_subcategorie_media_cmedia foreign key (cmedia) references categorie_media (id_cmedia) on delete cascade;
commit;

create sequence seq_001_subcategorie_media
minvalue 100
start with 100
increment by 1
cache 20;
commit;

create or replace trigger trg_001_subcategorie_media
before insert on subcategorie_media for each row 
begin
select 'SM'||to_char(seq_001_subcategorie_media.nextval)
into :new.id_smedia
from dual;
end;
commit;

create or replace trigger trg_002_subcategorie_media
before insert or update
on subcategorie_media
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_002_subcategorie_media;
commit;

create or replace trigger trg_003_subcategorie_media
before insert or update
on subcategorie_media
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_003_subcategorie_media;
commit;

insert into subcategorie_media (cmedia,denumire,descriere) values ('CM10','dummy','dummy');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM11','general','general');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM11','Anastasia','Anastasia');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM11','Maria','Maria');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM11','Mirela','Mirela');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM11','Virgil','Virgil');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM12','general','general');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM12','Concedii in tara','Concedii in tara');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM12','Concedii in strainatate','Concedii in strainatate');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM12','Calatorii ocazionale','Calatorii ocazionale');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM12','Calatorii in interes de serviciu','Calatorii in interes de serviciu');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM13','Muzica','Muzica');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM13','Filme','Filme');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM13','Prezentari PP','Prezentari PP');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM13','Slideshow-uri','Slideshow-uri');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM13','DVD Media','DVD Media');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM14','general','general');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM14','Nunta','Nunta');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM14','Botez','Botez');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM14','Luna de miere','Luna de miere');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM15','general','general');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM15','Anastasia','Anastasia');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM15','Maria','Maria');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM15','Mirela','Mirela');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM15','Virgil','Virgil');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM16','general','general');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM16','Intelinvest','Intelinvest');
insert into subcategorie_media (cmedia,denumire,descriere) values ('CM16','Apavital','Apavital');
commit;

-- detaliu_media

create table detaliu_media (
id_detaliu varchar2(20) primary key,
descriere varchar2(500),
modificat_de varchar2(50),
modificat_la date
);
commit;

create sequence seq_001_detaliu_media
minvalue 1000
start with 1000
increment by 1
cache 20;
commit;

create or replace trigger trg_001_detaliu_media
before insert on detaliu_media for each row 
begin
select 'DM'||to_char(seq_001_detaliu_media.nextval)
into :new.id_detaliu
from dual;
end;
commit;

create or replace trigger trg_002_detaliu_media
before insert or update
on detaliu_media
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_002_detaliu_media;
commit;

create or replace trigger trg_003_detaliu_media
before insert or update
on detaliu_media
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_003_detaliu_media;
commit;

insert into detaliu_media (descriere) values ('dummy');
commit;

-- perioade

create table perioade (
id_perioada varchar2(20) primary key,
denumire varchar2(50),
de_la date,
la date
);
commit;

create sequence seq_001_perioade_ani
minvalue 2005
start with 2005
increment by 1
cache 20;
commit;

create sequence seq_005_perioade_2005
minvalue 5001
start with 5001
increment by 1
cache 20;
commit;
create sequence seq_006_perioade_2006
minvalue 6001
start with 6001
increment by 1
cache 20;
commit;
create sequence seq_007_perioade_2007
minvalue 7001
start with 7001
increment by 1
cache 20;
commit;
create sequence seq_008_perioade_2008
minvalue 8001
start with 8001
increment by 1
cache 20;
commit;
create sequence seq_009_perioade_2009
minvalue 9001
start with 9001
increment by 1
cache 20;
commit;
create sequence seq_010_perioade_2010
minvalue 1001
start with 1001
increment by 1
cache 20;
commit;
create sequence seq_011_perioade_2011
minvalue 1101
start with 1101
increment by 1
cache 20;
commit;
create sequence seq_012_perioade_2012
minvalue 1201
start with 1201
increment by 1
cache 20;
commit;
create sequence seq_013_perioade_2013
minvalue 1301
start with 1301
increment by 1
cache 20;
commit;

create or replace trigger trg_001_perioade_ani
before insert on perioade for each row
when (new.denumire like 'Anul%')
begin
select 'PAN'||to_char(seq_001_perioade_ani.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_005_perioade_2005
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2005')
begin
select 'PER'||to_char(seq_005_perioade_2005.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_006_perioade_2006
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2006')
begin
select 'PER'||to_char(seq_006_perioade_2006.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_007_perioade_2007
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2007')
begin
select 'PER'||to_char(seq_007_perioade_2007.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_008_perioade_2008
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2008')
begin
select 'PER'||to_char(seq_008_perioade_2008.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_009_perioade_2009
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2009')
begin
select 'PER'||to_char(seq_009_perioade_2009.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_010_perioade_2010
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2010')
begin
select 'PER'||to_char(seq_010_perioade_2010.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_011_perioade_2011
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2011')
begin
select 'PER'||to_char(seq_011_perioade_2011.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_012_perioade_2012
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2012')
begin
select 'PER'||to_char(seq_012_perioade_2012.nextval)
into :new.id_perioada
from dual;
end;
commit;

create or replace trigger trg_013_perioade_2013
before insert on perioade for each row
when (new.denumire not like 'Anul%' and new.denumire like '%2013')
begin
select 'PER'||to_char(seq_013_perioade_2013.nextval)
into :new.id_perioada
from dual;
end;
commit;

insert into perioade (denumire,de_la,la) values ('Anul 2005', to_date('01.01.2005','dd.mm.yyyy'), to_date('31.12.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2005', to_date('01.01.2005','dd.mm.yyyy'), to_date('31.01.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2005', to_date('01.02.2005','dd.mm.yyyy'), to_date('28.02.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2005', to_date('01.03.2005','dd.mm.yyyy'), to_date('31.03.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2005', to_date('01.04.2005','dd.mm.yyyy'), to_date('30.04.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2005', to_date('01.05.2005','dd.mm.yyyy'), to_date('31.05.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2005', to_date('01.06.2005','dd.mm.yyyy'), to_date('30.06.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2005', to_date('01.07.2005','dd.mm.yyyy'), to_date('31.07.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2005', to_date('01.08.2005','dd.mm.yyyy'), to_date('31.08.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2005', to_date('01.09.2005','dd.mm.yyyy'), to_date('30.09.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2005', to_date('01.10.2005','dd.mm.yyyy'), to_date('31.10.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2005', to_date('01.11.2005','dd.mm.yyyy'), to_date('30.11.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2005', to_date('01.12.2005','dd.mm.yyyy'), to_date('31.12.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2006', to_date('01.01.2006','dd.mm.yyyy'), to_date('31.12.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2006', to_date('01.01.2006','dd.mm.yyyy'), to_date('31.01.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2006', to_date('01.02.2006','dd.mm.yyyy'), to_date('28.02.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2006', to_date('01.03.2006','dd.mm.yyyy'), to_date('31.03.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2006', to_date('01.04.2006','dd.mm.yyyy'), to_date('30.04.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2006', to_date('01.05.2006','dd.mm.yyyy'), to_date('31.05.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2006', to_date('01.06.2006','dd.mm.yyyy'), to_date('30.06.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2006', to_date('01.07.2006','dd.mm.yyyy'), to_date('31.07.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2006', to_date('01.08.2006','dd.mm.yyyy'), to_date('31.08.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2006', to_date('01.09.2006','dd.mm.yyyy'), to_date('30.09.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2006', to_date('01.10.2006','dd.mm.yyyy'), to_date('31.10.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2006', to_date('01.11.2006','dd.mm.yyyy'), to_date('30.11.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2006', to_date('01.12.2006','dd.mm.yyyy'), to_date('31.12.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2007', to_date('01.01.2007','dd.mm.yyyy'), to_date('31.12.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2007', to_date('01.01.2007','dd.mm.yyyy'), to_date('31.01.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2007', to_date('01.02.2007','dd.mm.yyyy'), to_date('28.02.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2007', to_date('01.03.2007','dd.mm.yyyy'), to_date('31.03.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2007', to_date('01.04.2007','dd.mm.yyyy'), to_date('30.04.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2007', to_date('01.05.2007','dd.mm.yyyy'), to_date('31.05.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2007', to_date('01.06.2007','dd.mm.yyyy'), to_date('30.06.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2007', to_date('01.07.2007','dd.mm.yyyy'), to_date('31.07.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2007', to_date('01.08.2007','dd.mm.yyyy'), to_date('31.08.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2007', to_date('01.09.2007','dd.mm.yyyy'), to_date('30.09.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2007', to_date('01.10.2007','dd.mm.yyyy'), to_date('31.10.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2007', to_date('01.11.2007','dd.mm.yyyy'), to_date('30.11.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2007', to_date('01.12.2007','dd.mm.yyyy'), to_date('31.12.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2008', to_date('01.01.2008','dd.mm.yyyy'), to_date('31.12.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2008', to_date('01.01.2008','dd.mm.yyyy'), to_date('31.01.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2008', to_date('01.02.2008','dd.mm.yyyy'), to_date('29.02.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2008', to_date('01.03.2008','dd.mm.yyyy'), to_date('31.03.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2008', to_date('01.04.2008','dd.mm.yyyy'), to_date('30.04.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2008', to_date('01.05.2008','dd.mm.yyyy'), to_date('31.05.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2008', to_date('01.06.2008','dd.mm.yyyy'), to_date('30.06.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2008', to_date('01.07.2008','dd.mm.yyyy'), to_date('31.07.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2008', to_date('01.08.2008','dd.mm.yyyy'), to_date('31.08.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2008', to_date('01.09.2008','dd.mm.yyyy'), to_date('30.09.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2008', to_date('01.10.2008','dd.mm.yyyy'), to_date('31.10.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2008', to_date('01.11.2008','dd.mm.yyyy'), to_date('30.11.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2008', to_date('01.12.2008','dd.mm.yyyy'), to_date('31.12.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2009', to_date('01.01.2009','dd.mm.yyyy'), to_date('31.12.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2009', to_date('01.01.2009','dd.mm.yyyy'), to_date('31.01.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2009', to_date('01.02.2009','dd.mm.yyyy'), to_date('28.02.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2009', to_date('01.03.2009','dd.mm.yyyy'), to_date('31.03.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2009', to_date('01.04.2009','dd.mm.yyyy'), to_date('30.04.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2009', to_date('01.05.2009','dd.mm.yyyy'), to_date('31.05.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2009', to_date('01.06.2009','dd.mm.yyyy'), to_date('30.06.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2009', to_date('01.07.2009','dd.mm.yyyy'), to_date('31.07.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2009', to_date('01.08.2009','dd.mm.yyyy'), to_date('31.08.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2009', to_date('01.09.2009','dd.mm.yyyy'), to_date('30.09.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2009', to_date('01.10.2009','dd.mm.yyyy'), to_date('31.10.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2009', to_date('01.11.2009','dd.mm.yyyy'), to_date('30.11.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2009', to_date('01.12.2009','dd.mm.yyyy'), to_date('31.12.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2010', to_date('01.01.2010','dd.mm.yyyy'), to_date('31.12.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2010', to_date('01.01.2010','dd.mm.yyyy'), to_date('31.01.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2010', to_date('01.02.2010','dd.mm.yyyy'), to_date('28.02.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2010', to_date('01.03.2010','dd.mm.yyyy'), to_date('31.03.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2010', to_date('01.04.2010','dd.mm.yyyy'), to_date('30.04.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2010', to_date('01.05.2010','dd.mm.yyyy'), to_date('31.05.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2010', to_date('01.06.2010','dd.mm.yyyy'), to_date('30.06.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2010', to_date('01.07.2010','dd.mm.yyyy'), to_date('31.07.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2010', to_date('01.08.2010','dd.mm.yyyy'), to_date('31.08.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2010', to_date('01.09.2010','dd.mm.yyyy'), to_date('30.09.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2010', to_date('01.10.2010','dd.mm.yyyy'), to_date('31.10.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2010', to_date('01.11.2010','dd.mm.yyyy'), to_date('30.11.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2010', to_date('01.12.2010','dd.mm.yyyy'), to_date('31.12.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2011', to_date('01.01.2011','dd.mm.yyyy'), to_date('31.12.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2011', to_date('01.01.2011','dd.mm.yyyy'), to_date('31.01.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2011', to_date('01.02.2011','dd.mm.yyyy'), to_date('28.02.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2011', to_date('01.03.2011','dd.mm.yyyy'), to_date('31.03.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2011', to_date('01.04.2011','dd.mm.yyyy'), to_date('30.04.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2011', to_date('01.05.2011','dd.mm.yyyy'), to_date('31.05.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2011', to_date('01.06.2011','dd.mm.yyyy'), to_date('30.06.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2011', to_date('01.07.2011','dd.mm.yyyy'), to_date('31.07.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2011', to_date('01.08.2011','dd.mm.yyyy'), to_date('31.08.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2011', to_date('01.09.2011','dd.mm.yyyy'), to_date('30.09.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2011', to_date('01.10.2011','dd.mm.yyyy'), to_date('31.10.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2011', to_date('01.11.2011','dd.mm.yyyy'), to_date('30.11.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2011', to_date('01.12.2011','dd.mm.yyyy'), to_date('31.12.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2012', to_date('01.01.2012','dd.mm.yyyy'), to_date('31.12.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2012', to_date('01.01.2012','dd.mm.yyyy'), to_date('31.01.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2012', to_date('01.02.2012','dd.mm.yyyy'), to_date('29.02.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2012', to_date('01.03.2012','dd.mm.yyyy'), to_date('31.03.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2012', to_date('01.04.2012','dd.mm.yyyy'), to_date('30.04.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2012', to_date('01.05.2012','dd.mm.yyyy'), to_date('31.05.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2012', to_date('01.06.2012','dd.mm.yyyy'), to_date('30.06.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2012', to_date('01.07.2012','dd.mm.yyyy'), to_date('31.07.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2012', to_date('01.08.2012','dd.mm.yyyy'), to_date('31.08.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2012', to_date('01.09.2012','dd.mm.yyyy'), to_date('30.09.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2012', to_date('01.10.2012','dd.mm.yyyy'), to_date('31.10.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2012', to_date('01.11.2012','dd.mm.yyyy'), to_date('30.11.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2012', to_date('01.12.2012','dd.mm.yyyy'), to_date('31.12.2012','dd.mm.yyyy'));
commit;
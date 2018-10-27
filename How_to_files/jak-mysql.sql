mysql -u root -p # odpalamy mysql u user p password , podajemy password..
create database "nazwa"; # tworzy baze
show database ; # pokazuje nam liste baz
use "nazwa bazy"; # operujemy na konkretnej bazie
show tables; # pokazuje tabele (jak są)
create table "nazwa tabeli"("nazwa pola" "rodzaj zmiennej" "jakieś parametry np.auto_increment" , ..);
	PRZYKŁAD -- create table pracownicy(id int auto_increment, imie varchar(20),primery key(id));
desc "nazwa tabeli"; #pokazuje tabele z opisami tj. jak jest skąstruowana
insert into "nazwa tabeli" valuse(null ,'Jan'); # dodajemy dane do tabeli
select * from "nazwa tabeli" ; # pokazuje wszystkie dane z tabieli
select * from "nazwa tabeli" where imie='Jan' and ... ; # pokazuje wszystkie dane z tabieli gdzie imie = Jan and 	inne parametry
update "nazwa tabieli" set "dzial=2" where id=1; # zmienia w bazie parametr "dzial" gdzie ...
select sum(zarobki) from "nazwa tabieli" # sumuje
delete from "nazwa tabeli" WHERE id=1; # usówa rekord o id 1 
select "kolumna z tabeli1", "kolumna z tabeli2" from "nazwa tabeli1" , "nazwa tabeli2" WHERE "koluma1 z koluma1"="koluma z tabeli2";
	# łączymy nazwy kolum z dwóch tabel aby nie powielały się w wyniku



ZMIENNE W BAZIE
int
varchar(x) - 0-255
datetime # m;y;d g;m;s
date # sama data
text



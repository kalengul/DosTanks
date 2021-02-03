program pr1;
var
f:text;
s,s1:string;
m:array [1..5,1..5] of integer;
v:array [1..2] of integer;
i:integer;
begin
writeln('Введите название карты');
readln(s);
s:=s+'.txt';
assign(f,s);
rewrite(f);
for i:=1 to 5 do
begin
writeln('Введите коордонаты игрока ',i);
readln(m[1,i],m[2,i]);
str(m[1,i],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s1;
str(m[2,i],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s+' '+s1;
writeln('Введите направление и броню ',i);
readln(m[3,i],m[5,i]);
str(m[3,i],s1);
s:=s+' '+s1;
str(m[5,i],s1);
s:=s+' '+s1;
writeln(f,s);
end;
writeln(f,'');
while v[1]<>-1 do
begin
writeln('Введите координаты Воды -1 - Выход');
readln(v[1],v[2]);
str(v[1],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s1;
str(v[2],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s+' '+s1;
if v[1]<>-1 then
writeln(f,s);
end;
writeln(f,'');
v[1]:=0;
while v[1]<>-1 do
begin
writeln('Введите координаты Бетона -1 - Выход');
readln(v[1],v[2]);
str(v[1],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s1;
str(v[2],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s+' '+s1;
if v[1]<>-1 then
writeln(f,s);
end;
writeln(f,'');
v[1]:=0;
while v[1]<>-1 do
begin
writeln('Введите координаты Кирпича -1 - Выход');
readln(v[1],v[2]);
str(v[1],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s1;
str(v[2],s1);
if length(s1)=1 then s1:='0'+s1;
s:=s+' '+s1;
if v[1]<>-1 then
writeln(f,s);
end;
close(f);
end.